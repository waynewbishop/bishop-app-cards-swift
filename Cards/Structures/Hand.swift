//
//  Hand.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

class Hand : Scoreable {
    
    private var elements = Array<Card>()
    
    
    //numer of cards - hearts, uno
    var count: Int {
        return elements.count
    }
    
    var score: Int {
        //gets computed as the hand changes.. - blackjack
        var total: Int = 0
        
        for s in self.elements {
            total += s.score.value
        }
        
        return total
    }
    

    //show the top card - but don't remove it from the hand
    func peek() -> Card? {
        return self.elements.first
    }
    
        
    /// Show players hand
    /// - Returns: The series of cards

    func show() -> Array<Card>? {
        
        //trivial check
        guard elements.count > 0 else {
            return nil
        }
        
        return self.elements
    }
    
    
    
    /// Prepare to recieve one or more cards
    /// - Parameter card: cards to be recevied

    func receive(cards: Array<Card>) {
        
        //list of cards
        for c in cards {
            elements.append(c)
        }
        elements.sort()
    }
    
    
    
    /// Play a selected card
    /// - Parameter index: Index of the card to be played
    /// - Returns: The card instance

    func play(_ index: Int) -> Card? {
        
        if elements.indices.contains(index) {
            let card = elements.remove(at: index)
            elements.sort()
            
            return card
        }
        else {
            return nil
        }
    }
        
    
    //equatable conformance - used to compare hands
    public static func == (lhs: Hand, rhs: Hand) -> Bool {
        return lhs.score == rhs.score
    }
    
}
