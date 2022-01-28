//
//  Playable.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


protocol Playable {
    
    var players: Queue<Player> { get set }
    var hasStarted: Bool { get set }
    var deck: Deck { get }
    
    func start() ->()
    func score(of player: Player) -> Int
    func nextTurn() -> ()

}

//implementation common to all games

extension Playable {
    
    func deal() {
        print("now dealing cards!")
    }
    
    func score(of player: Player) -> Int {
        return 0
    }
    
    func nextTurn() -> () {
        print("now processing the next player's turn..")
    }
    
}

