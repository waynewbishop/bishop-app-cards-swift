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
    
    @ObservedObject var uMessage = UIMessage()
    @Published var localPlayer = Player(name: "Wayne")
    @Published var status: String = "Waiting for players.."
    @Published var groupSession: GroupSession<Cards>?
    
    var sessionMessenger: GroupSessionMessenger?
    var tasks = Set<Task<Void, Never>>()
    

    //current player
    var current: Player? {
        guard let player = tMessage.players.peek else {
            return nil
        }
        return player
    }
        
    
    //action that initiates the group activity
    func startSharing() {
        Task {
            do {
                _ = try await Cards().activate()
            } catch {
                self.status = "failed to activate Cards activity: \(error)"
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
        
        //add new local player to group queue
        tMessage.players.enQueue(localPlayer)
                
        tMessage.action = .new
        sendMessage(message: tMessage)
        
        self.status += "\n" + localPlayer.name + " just joined session.."
                
    }

    
    //handle different scenarios here directly based on the .action enum.
    func handle() {
        
    }

    
    //send message to participants
    func sendMessage(message: TableMessage) {
        
        Task {
            if let message = self.sessionMessenger {
        
                do {
                    try await message.send(tMessage, to: .all)
                } catch {
                    self.status = "unable to send message: \(error)"
                }
            }
            
        } //end task
    }
    
    
    func configureReceiveMessage() {
        
        if let messenger = self.sessionMessenger {
            let task = Task {
                
                //receive tableMessage from api.
                for await (response, context) in messenger.messages(of: TableMessage.self) {
                    uMessage.handle(message: response, from: context.source.id)
                }
            }
            tasks.insert(task)
            
        }
    }

    
    //randomize the deck
    func deal() {
        
        guard self.groupSession != nil else {
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

        self.status = "dealing cards to players.."
        
        //post message
        tMessage.action = .deal
        sendMessage(message: tMessage)
    }
    
    
    //receive a card from the dealer (computer)
    func hit() {
        
        if let currentPlayer = self.current {
            if currentPlayer.participantUUID == localPlayer.participantUUID {
                
                if let card = tMessage.deck.cards.pop() {
                    
                    currentPlayer.hand.receive(card)
                    
                    self.status = "hit button pressed.."
                     
                    //post message
                    tMessage.action = .hit
                    sendMessage(message: tMessage)
                 }
            }
        }
    }

    
    //remove player from the queue
    func hold() {
        
        if let currentPlayer = self.current {
            if currentPlayer.participantUUID == localPlayer.participantUUID {
                
                //move to finished
                if let player = tMessage.players.deQueue() {
                    tMessage.holding.push(player)
                }
                                
                //post message
                tMessage.action = .hold
                sendMessage(message: tMessage)
                
                self.status = localPlayer.name + " holds with their cards.."
            }
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
