//
//  Blackjack.swift
//  Cards
//
//  Created by Wayne Bishop on 6/10/22.
//

import Foundation


class BlackJack : Playable {
    
    var description: String = "Blackjack"
    

    /// Evaluate a specific player's hand
    /// - Parameter hand: A player's hand
    /// - Returns: A specific outcome enumeration
    func evaluate(player: Player) -> Outcome {
        
        let score = player.hand.score
        
        let scoreRange = 1..<21
        
        if score == scoreRange.upperBound {
            return .winner
        }
        
        else if scoreRange.contains(score) {
            return .safe
        }
        else {
            return .bust
        }
    }
    
    
    
    /// Find any winning hands
    /// - Parameter hands: A collection of player's hands
    /// - Returns: A filtered series of player's hands
    func winning(players: [Player]) -> [Player] {
        
        let results = players.filter { player in
            return self.score(of: player) == 21
        }
        
        return results
    }
    
    
    
    /// Ranks a hand collection
    /// - Parameter hands: a collection of player's hands
    /// - Returns: An ordered collection of player's hands
    func rank(players: [Player]) -> [Player] {
        
        /*
         create a RankTree data structure. Use the players scopre
         as a basis for the BST evaluation
         */
        
        //the tree gets created here, with the basis of
        //comparision being self.score from the blackjack game
        //rules.
        
        return [Player]()
    }
    

    
    /// <#Description#>
    /// - Parameter player: <#player description#>
    /// - Returns: <#description#>
    func score(of player: Player) -> Int {

        var total: Int = 0
        let number_range = 2...10
        let face_range = 11...13
        var hasAce: Bool = false  //TODO: Change this to an Int?
                
        for card in player.hand.cards {
            
            if card.unit.value == 1 {
                hasAce = true
            }
            
            //add to total if the range is between 2 and 10
            if number_range.contains(card.unit.value) {
                total += card.unit.value
            }
            
            //add 10 points if range is between 11 and 13
            if face_range.contains(card.unit.value) {
                if let secondary = card.unit.secondary {
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
