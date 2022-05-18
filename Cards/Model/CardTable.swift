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
    @Published var response: String = "Waiting for players.."
    @Published var groupSession: GroupSession<Cards>?
    
    var messenger: GroupSessionMessenger?
    

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
                self.response = "failed to activate Cards activity: \(error)"
            }
        }
    }

    
    //add the existing user to the shared session
    func configureGroupSession(_ groupSession: GroupSession<Cards>) {
        
        self.response = "configuring the session for a new user."
        self.groupSession = groupSession
        
        //create the messenger for the session
        let messenger = GroupSessionMessenger(session: groupSession)
        self.messenger = messenger
                
        groupSession.join()
        self.response = "Just joined session"
        
        localPlayer.participantUUID = groupSession.localParticipant.id
        self.response = localPlayer.participantUUID?.uuidString ?? "No ID"
        
        //add new local player to shared queue
        tMessage.players.enQueue(localPlayer)
        
        
        groupSession.activeParticipants.forEach { participant in
            print("ID for this participant: ", participant.id)
        }
    }

    
    //send message to participants
    func sendMessage(message: TableMessage) {
        
        Task {
            if let message = self.messenger {
        
                do {
                    try await message.send(tMessage, to: .all)
                } catch {
                    self.response = "unable to send message: \(error)"
                }
            }
            
        } //end task
    }
    
    
    func recieveMessage() {
        //receive message from the api
        
        //todo: handle message and check everyone's score
        //from the last turn. Has anyone won the game or
        //has gone over 21?
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
        
        if let current = tMessage.players.peek() {
            if current.participantUUID == localPlayer.participantUUID {
                _ = tMessage.players.deQueue()
                
                if let card = tMessage.deck.cards.pop() {
                    current.hand.receive(card)
                    tMessage.players.enQueue(current)
                    
                    //post message
                    tMessage.action = .hit
                    sendMessage(message: tMessage)
                 }
            }
        }
    }
    
    
    func hold() {
        
    }
    
    
}
