//
//  Hand.swift
//  Cards
//
//  Created by Sam Warfield on 11/12/21.
//

import Foundation

struct Hand {
//    var hand = Heap<Card>(type: .max)
    private(set) var cards: [Card] = []
    var score: Int = 0
    
    var count: Int {
        cards.count
    }
    
    func peek() -> Card? {
        cards.first
    }
    
    func show() -> [Card] {
        cards
    }
    
    mutating func add(card: Card) {
        cards.append(card)
        cards.sort()
    }
    
    mutating func play(_ index: Int) -> Card? {
        if cards.indices.contains(index) {
            let card = cards.remove(at: index)
            cards.sort()
            
            return card
        }
        else {
            return nil
        }
    }
}
 
extension Hand: Equatable {
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        lhs.score == rhs.score
    }
}
