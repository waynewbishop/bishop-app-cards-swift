//
//  Blackjack.swift
//  Cards
//
//  Created by Wayne Bishop on 11/11/21.
//

import Foundation

protocol Gameable {
    
}

protocol BlackJack: Gameable {
    func score(of hand: Hand) -> Int
}

extension BlackJack {
    func score(of hand: Hand) -> Int {
        print("code goes here..")
        return 0
    }
}


/*
 ///Logic moved to the player's hand.
 
struct Game  {
    
    let id = UUID()
    
    //todo: what about other actions like a
    //when a player winss or if there's a bust?
        
    func score(of player: Player) -> Int {
        
        //gets computed as the hand changes.. - blackjack
        var total: Int = 0
        let number_range = 2...10
        let face_range = 11...13
        var hasAce: Bool = false  //TODO: Change this to an Int?
                
        for card in player.hand.cards {
            
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
            
}

*/

