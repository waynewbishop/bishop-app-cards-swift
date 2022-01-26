//
//  Playable.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


protocol Playable: Blackjack, Poker {
    
    var players: Queue<Player> { get set }
    var hasStarted: Bool { get set }
    var deck: Deck { get }
    
    func start() ->()
    func score(of player: Player) -> Int
    func deal() -> ()
}

