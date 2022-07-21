//
//  Poker.swift
//  Cards
//
//  Created by Wayne Bishop on 6/28/22.
//

import Foundation

class Poker: Playable {
        
    lazy var description: String = "Poker"  //change to computed property..?
    var cardsToDeal: Int = 5
    
    func evaluate(player: Player) -> Outcome {
        return .undecided
    }
    
    func score(of player: Player) -> Int {
        return 0
    }
    
    func rank(players: [Player]) -> [Player] {
        return players.sorted()
    }
    
}
