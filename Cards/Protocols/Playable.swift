//
//  Playable.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

protocol Playable {
    
    var players: Array<Player> { get set }
    var hasStarted: Bool { get set }
    var deck: Deck { get }
    
    func start() ->()
    func call() -> Player?
    func deal(_ player: inout Player) ->()
    func draw(_ player: inout Player) ->()
    func fold(_ player: inout Player) ->()
}


extension Playable {  //extension of a protocol
    
    mutating func addPlayer(_ player: inout Player) {
        if self.hasStarted == false {
            players.append(player)  //reference being added..
        }
    }

}
