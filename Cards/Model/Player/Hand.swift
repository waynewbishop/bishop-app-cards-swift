//
//  Hand.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

class Hand {
    
    var cards = Array<Card>()
    
    
    //numer of cards - hearts, uno
    var count: Int {
        return cards.count
    }
        

    //show the top card - but don't remove it from the hand
    func peek() -> Card? {
        return self.cards.first
    }
    
        
    /// Show players hand
    /// - Returns: The series of cards

    func show() -> Array<Card>? {
        
        //trivial check
        guard cards.count > 0 else {
            return nil
        }
        
        return self.cards
    }
    
    
    
    /// Prepare to recieve one or more cards
    /// - Parameter card: cards to be recevied

    func receive(_ card: Card) {
        
        //list of cards
        cards.append(card)
        
        //sort cards - compared value
        cards.sort()
    }
    
    
    
    /// Play a selected card
    /// - Parameter index: Index of the card to be played
    /// - Returns: The card instance

    func send(_ index: Int) -> Card? {
        
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
