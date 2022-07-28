//
//  Playable.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


protocol Playable {
    
    // var dealer: Dealerable { get }
    var description: String {get set}
    var cardsToDeal: Int {get}
    
    //var gameplay: Turns {get} defines if turns are made between players
    
    func evaluate(player: Player) -> Outcome

    
    /// Returns a player's  score
    /// - Parameter player: The specified player
    /// - Returns: A generic comparable value (e.g. Int)
    func score(of player:  Player) -> Int
    
    
    
    /// Ranks a hand collection
    /// - Parameter hands: a collection of player's hands
    /// - Returns: An ordered collection of player's hands
    func rank(players: [Player]) -> [Player]
}
