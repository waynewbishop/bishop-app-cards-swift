//
//  Playable.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


@MainActor

//todo: Player should be passed as a parameter instead of Hand.

protocol Playable {
        
    /// Evaluate a specific player's hand
    /// - Parameter hand: A player's hand
    /// - Returns: A specific outcome enumeration
    func evaluate(hand: Hand) -> Outcome
    
    
    /// Find any winning hands
    /// - Parameter hands: A collection of player's hands
    /// - Returns: A filtered series of player's hands
    func winning(hands: [Hand]) -> [Hand]?
    

    
    /// Ranks a hand collection
    /// - Parameter hands: a collection of player's hands
    /// - Returns: An ordered collection of player's hands
    func rank(hands: [Hand]) -> [Hand]
}

/*
class BlackJack : Playable {
    
    func evaluate(hand: Hand) -> Outcome {
        <#code#>
    }
    
    func evaluate(hands: [Hand]) -> [Hand]? {
        <#code#>
    }
    
    func rank(hands: [Hand]) -> [Hand] {
        <#code#>
    }
}
*/
