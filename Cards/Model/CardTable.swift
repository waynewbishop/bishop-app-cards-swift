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
    
    @ObservedObject var tMessage = TableMessage()
        
    @Published var localPlayer = Player(name: "Wayne")
    @Published var status: String = "Waiting for players.."
    @Published var groupSession: GroupSession<Cards>?
    
    var sessionMessenger: GroupSessionMessenger?
    var tasks = Set<Task<Void, Never>>()
    

    //current player
    var current: Player? {
        guard let player = tMessage.players.peek() else {
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
        
        self.status = "configuring the session for a new user."
        self.groupSession = groupSession
        
        //create the messenger for the session
        let messenger = GroupSessionMessenger(session: groupSession)
        self.sessionMessenger = messenger
                
        groupSession.join()
        
        self.status = localPlayer.name + " just joined session.."
        
        localPlayer.participantUUID = groupSession.localParticipant.id
        self.status = localPlayer.participantUUID?.uuidString ?? "No ID"
        
        //add new local player to shared queue
        tMessage.players.enQueue(localPlayer)
        
        groupSession.activeParticipants.forEach { participant in
            print("ID for this participant: ", participant.id)
        }
        
        
        //send the updated queue
        tMessage.action = .new
        sendMessage(message: tMessage)
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
    
    
    //receive tableMessage from api.
    func recieveMessage() {
        
        //todo: handle message and check everyone's score
        //from the last turn. Has anyone won the game or
        //has gone over 21?
        
        if let messenger = self.sessionMessenger {
            var task = Task {
                for await (response, context) in messenger.messages(of: TableMessage.self) {
                    
                    //todo: check tableMessage action and each players score.
                    //todo: check to see how many active players remain in the queue
                    //todo: if the queue is zero, check the holding list to determine the winner..
                    //todo: use context.participant to determine who initiated the previous action.
                    //todo: if the queue isn't empty, let players know who's turn it is next.
                    //todo: update any UI components with revised TableMessage information
                    
                    let participantID = context.source.id.uuidString
                    //if required, look up the player metadata based on their particpant id
                    
                    switch response.action {
                        
                    case .hold:
                        status = "player " + participantID + " is holding.."
                    case .new:
                        status = "new player " + participantID + " has joined.."
                    case .hit:
                        status = "player " + participantID + " recieved a new card.."
                    case .deal:
                        status = "new cards dealt to players.."
                        
                    default:
                        status = "response received from player " + participantID
                    }

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

        
        //post message
        tMessage.action = .deal
        sendMessage(message: tMessage)
    }
    
    
    //receive a card from the dealer (computer)
    func hit() {
        
        if let currentPlayer = self.current {
            if currentPlayer.participantUUID == localPlayer.participantUUID {
                
                _ = tMessage.players.deQueue()
                
                if let card = tMessage.deck.cards.pop() {
                    
                    currentPlayer.hand.receive(card)
                    tMessage.players.enQueue(currentPlayer)
                    
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
                self.status = localPlayer.name + " holds with their cards.."
            }
        }
    }
    
}
