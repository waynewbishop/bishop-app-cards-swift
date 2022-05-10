//
//  Deck.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

class Deck: Codable {
    
    var cards = Stack<Card>()
    
    init() {
        
        var suits = Array<Suit>()
        
        suits.append(Suit(of: "Hearts"))
        suits.append(Suit(of: "Diamonds"))
        suits.append(Suit(of: "Spades"))
        suits.append(Suit(of: "Clubs"))

        //scores template generates cards for the entire suit
        for suit in suits {
            
            for s in suit.scores {
                
                let card = Card()
                
                card.suit.name = suit.name       //name of the suit 'hearts'
                card.score.name = s.name         //name of card 'A'
                card.score.value = s.value      //card value '1'
                card.score.secondary = s.secondary
                
                //push card to deck
                self.cards.push(card)
            }
        }
        
    } //end init
    
    
    ///Randomize all the array values in the deck
    func shuffle() {
        
        let cardRange: Range = 0..<cards.count
        
        for _ in 0...cards.count {
            
            //obtain random values
            let first = Int.random(in: cardRange)
            let second = Int.random(in: cardRange)
            
            //swap card positions
            cards.elements.swapAt(first, second)
        }
    }
    
    
    
    /// Removes a card from the deck
    /// - Returns: A card - optional

    public func draw() -> Card? {
        return self.cards.pop()
    }

    
} //end class
