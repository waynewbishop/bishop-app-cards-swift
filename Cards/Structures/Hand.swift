//
//  Hand.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

class Hand : Scoreable {
    
    private var elements = Array<Card>()
        
    
    var score: Int {
        //gets computed as the hand changes..
        //gets included at the protocol level...
        return 0
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
