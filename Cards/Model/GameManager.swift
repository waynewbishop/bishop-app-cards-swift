//
//  GameSessionManager.swift
//  Cards
//
//  Created by Wayne Bishop on 7/15/22.
//

import Foundation
import Combine
import SwiftUI
import GroupActivities


/*
 under this new design, the game works as a
 published property of the game manager.
 although the manager has no knowledge of how a game works
 it receives posted messages from changes in game state which are
 published to the UI.
 */


class GameManager: ObservableObject, GameDelegate {

    @ObservedObject var uiMessage = UIMessage()
    
    @Published var groupSession: GroupSession<Cards>?
    @Published var response: String = "Waiting for players.."
    @Published var game = Game()
    
    var sessionMessenger: GroupSessionMessenger?
    var tasks = Set<Task<Void, Never>>()

    
    init() {
        game.delegate = self
    }
    
    
    //MARK: Group Activities
    
    //start group sharing
    func startSharing() {
        Task {
            do {
                _ = try await Cards().activate()
            } catch {
                self.response = "failed to activate Cards activity: \(error)"
            }
        }
    }
    

    
    //add the existing user to the shared session
    func configureGroupSession(_ groupSession: GroupSession<Cards>) {
        
        self.groupSession = groupSession
                
        //create the messenger for the session
        if #available(iOS 16, *) {
            let messenger = GroupSessionMessenger(session: groupSession, messageReliability: .unreliable)
            self.sessionMessenger = messenger
        }
        else {
            let messenger = GroupSessionMessenger(session: groupSession)
            self.sessionMessenger = messenger
        }
        
        //configure system to receive messages..
        self.receiveMessage()
        
        groupSession.join()
                
        game.addLocalPlayer(with: groupSession.localParticipant.id)
    }

    
    
    //send message to partipants
    func sendMessage(tMessage: TableMessage) {
        Task {
            if let message = self.sessionMessenger {
                do {
                    try await message.send(tMessage, to: .all)
                } catch {
                    self.response = "unable to send message: \(error)"
                }
            }
        } //end task
    }

    
    //todo: do we need a decision tree to determine when players are
    //playing versus the dealer as well as when the game ends?
    
    
    func receiveMessage() {
        if let messenger = self.sessionMessenger {
            let task = Task {
                for await (response, context) in messenger.messages(of: TableMessage.self) {
                    uiMessage.handle(message: response, from: context.source.id)
                                
                }
            }
            tasks.insert(task)
        }
    }
    
    
    
    //MARK: Delegate Methods
    
    func willReceiveMessage(message: TableMessage) {
        sendMessage(tMessage: message)
    }
    
    func willReceiveResponse(response: String) {
        self.response = response
    }
    
    

    //MARK: test different games
    
    func testGameBlackJack() -> GameManager {
        
        let blackjack: GameManager = GameManager()
        blackjack.game.setRules(rulebook: BlackJack())
        return blackjack
    }
    

    func testGamePoker() -> GameManager {
        
        let poker: GameManager = GameManager()
        poker.game.setRules(rulebook: Poker())
        return poker
    }
    
}
