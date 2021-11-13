//
//  Player.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    let name: String
    var score: Int = 0
    var hand = Hand()
    
    mutating func receive(_ card: Card) {
        hand.add(card: card)
    }
    
    mutating func playCard(index: Int) -> Card?  {
        hand.play(index)
    }
    
    mutating func resetHand() {
        hand = Hand()
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
}
