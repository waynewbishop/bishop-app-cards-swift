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
    func call() -> Player?
    func draw(_ player: inout Player) ->()
    func fold(_ player: inout Player) ->()
    func score(of player: inout Player) -> Int
}

