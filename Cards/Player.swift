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
    var hand = Heap<Card>(type: .max)
    
    func showHand() {
        print("Player: \(name)")
        print("---------")
        
        for s in hand.sequence {
            print("\(s.suit.name) - \(s.score.name)")
        }
        
        print("")
    }
    
    mutating func receive(_ card: Card) {
        hand.enQueue(card)
    }
    
    public func playCard(index: Int) -> Card?  {
        return nil
    }
    
    mutating func resetHand() {
        hand = Heap<Card>(type: .max)
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
}
