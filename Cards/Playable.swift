//
//  Playable.swift
//  Cards
//
//  Created by Sam Warfield on 11/7/21.
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

extension Playable {
    func draw(_ player: inout Player)  {
//        if let card = deck.cards.pop() {
//            player.hand.enQueue(card)
//        }
    }
}
