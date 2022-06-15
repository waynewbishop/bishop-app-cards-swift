//
//  Blackjack.swift
//  Cards
//
//  Created by Wayne Bishop on 6/10/22.
//

import Foundation


class BlackJack : Playable {

    
    /// The game name / description
    var description: String = "Blackjack"
    
    
    //todo: move the score code to this function..
    
    /// <#Description#>
    /// - Parameter player: <#player description#>
    /// - Returns: <#description#>
    func score(of player: Player) -> Int {
        return 0
    }
    
    
    /// Evaluate a specific player's hand
    /// - Parameter hand: A player's hand
    /// - Returns: A specific outcome enumeration
    func evaluate(player: Player) -> Outcome {
        
        let score = self.score(of: player)
        
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
        
}
