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
    
    @Published var localPlayer = Player(name: "Wayne")
    @Published var response: String = "Hello World.."
    @Published var groupSession: GroupSession<Cards>?
    
    var messenger: GroupSessionMessenger?
    
    //@StateObject var groupStateObserver = GroupStateObserver() //is this required at this level?
    
    
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
        print("Just joined session")
        localPlayer.participantUUID = groupSession.localParticipant.id
        self.response = localPlayer.participantUUID?.uuidString ?? "No ID"
        
        //add new local player to shared queue
        tMessage.players.enQueue(localPlayer)
        
        groupSession.activeParticipants.forEach { participant in
            print("ID for this participant: ", participant.id)
        }
    }

    
    
    //randomize the deck
    //todo: this function needs to return a boolean letting the system know cards where dealt.
    func deal() {
        
        guard self.groupSession != nil else {
            return
        }
        
        //shuffle the deck
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
        
        //todo: send update to API.
    }
    
    
    //reorganize to the next player
    func nextTurn() {
        if let prevPlayer  = tMessage.players.deQueue() {
            tMessage.players.enQueue(prevPlayer)
        }
    }

    
}
