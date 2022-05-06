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
class CardTable: ObservableObject, Playable {
    
    var players = Queue<Player>()
    var discard = Array<Card>()
    var deck = Deck()
    var hasStarted: Bool = false
    
    @Published var response: String = "Hello World.."
    @Published var groupSession: GroupSession<Cards>?
    
    var messenger: GroupSessionMessenger?
    
    
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
    }


    //how can this be replicated using the groupactivity API?
    func addPlayer(_ newPlayer: inout Player) {
        if self.hasStarted == false {
            players.enQueue(newPlayer)
        }
    }
    
    
    //randomize the deck
    //should this be it's own button action, based on the group session?
    //how are specific cards assigned to certain indivduals?
    func start() {
        
        //shuffle the deck
        deck.shuffle()
            
        //deal cards to all players
        for p in players.elements {
            
            //assign two cards per player
            for _ in 0..<2 {
                if let card = deck.cards.pop() {
                    card.faceup = true
                    p.hand.receive(card)
                }
            }
        }
        
        self.hasStarted = true
        
        //start the player turns
        self.nextTurn()
    }
    
    
    func nextTurn() {
        if let next  = self.players.deQueue() {
            next.isTurn = true
        }
    }

    
}
