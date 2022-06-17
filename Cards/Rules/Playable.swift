//
//  Playable.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


protocol Playable {

    
    /// The game name / description
    var description: String {get set}
    
    var numCards: Int {get set} //set the number of initial cards assigned to each player (depends on game)
    
    /// Returns a player's  score
    /// - Parameter player: The specified player
    /// - Returns: A generic comparable value (e.g. Int)
    func score(of player:  Player) -> Int

    
    /// Evaluate a specific player's hand
    /// - Parameter hand: A player's hand
    /// - Returns: A specific outcome enumeration
    func evaluate(player: Player) -> Outcome
    
    
    /// Find any winning hands
    /// - Parameter hands: A collection of player's hands
    /// - Returns: A filtered series of player's hands
    func winning(players: [Player]) -> [Player]
    
    
    /// Ranks a hand collection
    /// - Parameter hands: a collection of player's hands
    /// - Returns: An ordered collection of player's hands
    func rank(players: [Player]) -> [Player]
}


