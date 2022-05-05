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
    @State var response: String = "Hello World.."
    
    @Published var groupSession: GroupSession<Cards>?
    var messenger: GroupSessionMessenger?
    
    
    func startSharing() {
        Task {
            do {
                _ = try await Cards().activate()
            } catch {
                print("Failed to activate Cards activity: \(error)")
            }
        }
    }

    
    //configure the user session
    func configureGroupSession(_ groupSession: GroupSession<Cards>) {
        print("configuring the session for new user..")
    }


    //how can this be replicated using the groupactivity API?
    func addPlayer(_ newPlayer: inout Player) {
        if self.hasStarted == false {
            players.enQueue(newPlayer)
        }
    }
    
    
    //randomize the deck
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
