//
//  CardTable.swift
//  Cards
//
//  Created by Wayne Bishop on 4/27/22.
//

import Foundation
import Combine
import SwiftUI
import GroupActivities


@MainActor

class CardTable: ObservableObject {
    
    var tMessage = TableMessage()
    
    @ObservedObject var uiMessage = UIMessage()

    //todo: how to we broadcast the game being played is blackjack?
    @Published var game: Playable? = BlackJack()
    
    @Published var localPlayer = Player(name: "Wayne")
    @Published var groupSession: GroupSession<Cards>?
    @Published var response: String = "Waiting for players.."
    
    var sessionMessenger: GroupSessionMessenger?
    var tasks = Set<Task<Void, Never>>()
 
    var current: Player? {
        guard let player = tMessage.players.peek else {
            return nil
        }
        return player
    }


    var isMyTurn: Bool {
        if let current = self.current {
            if current == localPlayer {
                return true
            }
        }
        else {
            return false
        }
        return false
    }
        
    
    //MARK: Group Messaging

    
    //start group activity
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
        let messenger = GroupSessionMessenger(session: groupSession)
        self.sessionMessenger = messenger
        
        //configure system to receive messages..
        self.configureReceiveMessage()
        
        groupSession.join()
        
        localPlayer.participantUUID = groupSession.localParticipant.id
        
        //add local player to game queue
        tMessage.players.enQueue(localPlayer)
                
        tMessage.action = .new
        sendMessage(message: tMessage)
        
        self.response += "\n" + localPlayer.name + " just joined session.."
                
    }

    
    //send message to participants
    func sendMessage(message: Codable) {
        
//        Checking byte count
//        let encoder = JSONEncoder()
//        let data = try! encoder.encode(message)
//        print(data)
        
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
    
    //todo: when late joiner are added to the session, they can be listed in the carousel, but
    //are not selected to play and are marked as spectators until a new round is started.
    
    func configureReceiveMessage() {
        
        if let messenger = self.sessionMessenger {
            let task = Task {
                
                //receive tableMessage from api.
                for await (response, context) in messenger.messages(of: TableMessage.self) {
                    
                    //find the previous player
                    let previous = tMessage.players.elements.first(where: {$0.participantUUID == context.source.id} )
                
                    
                    //todo: check to see how many active players remain in the queue
                    //todo: if the queue is zero, check the holding list to determine the winner..
                    //todo: use context.participant to determine who initiated the previous action.
                    
                    
                    //todo: calculate the previous action. Did they bust or safe?
                    //is anyone else left in the players queue? If so, enable resetting the game..
                    
                    uiMessage.handle(message: response, from: context.source.id)
                }
            }
            tasks.insert(task)
            
        }
    }


    
    func reset() {

        //todo: should there be a dedicated reset button or
        //should this process be added to an existing process?
        
        uiMessage = UIMessage()
        tMessage = TableMessage()
        
        // teardown existing groupSession.
        sessionMessenger = nil
        tasks.forEach { $0.cancel() }
        tasks = []
        if groupSession != nil {
            groupSession?.leave()
            groupSession = nil
            self.startSharing()
        }
        
    }

    
    //MARK: Game Actions
        
        
    //randomize the deck
    func deal() {
        
        guard self.groupSession != nil && tMessage.players.count > 1 else {
            return
        }
                
        tMessage.deck.shuffle()
            
        //deal cards to all players
        for p in tMessage.players.elements {
            
            //assign two cards per player
            for _ in 0..<2 {
                if let card = tMessage.deck.cards.pop() {
                    card.faceup = true
                    p.hand.receive(card)
                }
            }
        }

        self.response = "dealing cards to players.."
        
        //update status and action
        tMessage.action = .deal
        tMessage.status = .active
        
        sendMessage(message: tMessage)
    }
    
    
    //receive a card from the dealer (computer)
    func hit() {
        
        if let currentPlayer = self.current {
            if self.isMyTurn == true {
                
                if let card = tMessage.deck.cards.pop() {
                    
                    currentPlayer.hand.receive(card)
                    self.response = "hit button pressed.."
                     
                    //post message
                    tMessage.action = .hit
                    sendMessage(message: tMessage)
                 }
            }
        }
    }

    
    //remove player from the queue
    func hold() {
        
        if self.isMyTurn == true {
            
            //move to finished
            if let player = tMessage.players.deQueue() {
                tMessage.holding.push(player)
            }
                            
            //post message
            tMessage.action = .hold
            sendMessage(message: tMessage)
            
            self.response = localPlayer.name + " holds with their cards.."
        }
    }
    
    
    //remove from current game
    func fold() {
        
        _ = self.tMessage.players.remove(element: localPlayer)

         /*
         note: if they fold they are out of the game but are still
         connected to the shareplay session.
         */
        
        tMessage.action = .fold
        sendMessage(message: tMessage)
    }
    
}
