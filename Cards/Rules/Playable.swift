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
    var numberOfCardsToDeal: Int {get} //set the number of initial cards assigned to each player (depends on game)
    
    
    func evaluate(player: inout Player)
    
    /// Returns a player's  score
    /// - Parameter player: The specified player
    /// - Returns: A generic comparable value (e.g. Int)
    func score(of player:  Player) -> Int
    
//    func score(of player: inout Player) //refactor score calculations to make this work.. 
    
    
    /// Ranks a hand collection
    /// - Parameter hands: a collection of player's hands
    /// - Returns: An ordered collection of player's hands
    func rank(players: [Player]) -> [Player]
}


