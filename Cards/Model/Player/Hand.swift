//
//  Hand.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

class Hand : Codable {
    
    var cards = Array<Card>()
    
    
    //numer of cards - hearts, uno
    var count: Int {
        return cards.count
    }

    
    //gets computed as the hand changes
    var score: Int {
        
        var total: Int = 0
        let number_range = 2...10
        let face_range = 11...13
        var hasAce: Bool = false  //TODO: Change this to an Int?
                
        for card in self.cards {
            
            if card.score.value == 1 {
                hasAce = true
            }
            
            //add to total if the range is between 2 and 10
            if number_range.contains(card.score.value) {
                total += card.score.value
            }
            
            //add 10 points if range is between 11 and 13
            if face_range.contains(card.score.value) {
                if let secondary = card.score.secondary {
                    total += secondary
                }
            }
        }
        
        //TODO: Add back the ace(s) one at a time and recalculate..
        
        //add conditional rules for holding an ace
        if hasAce == true {
            if (total <= 10) {
                total += 11 //secondary ace value
            }
            else {
                total += 1 //primary ace value
            }
        }
                
        
        return total
        
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
