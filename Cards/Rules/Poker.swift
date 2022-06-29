//
//  Poker.swift
//  Cards
//
//  Created by Wayne Bishop on 6/28/22.
//

import Foundation

class Poker: Playable {
    
    var description: String = "Poker"
    var numberOfCardsToDeal: Int = 5

    
    func evaluate(player: inout Player) {
        print("testing")
    }
    
    func score(of player: Player) -> Int {
        return 0
    }
    
    func rank(players: [Player]) -> [Player] {
        return players.sorted()
    }
    
}
