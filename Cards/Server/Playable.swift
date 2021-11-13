//
//  Playable.swift
//  Cards
//
//  Created by Sam Warfield on 11/7/21.
//

import Foundation

protocol Playable {
    var players: [Player] { get }
    var deck: Deck { get }
    
    func deal() ->()
//    func call() -> Player?
//    func deal(_ player: inout Player) ->()
//    func draw(_ player: inout Player) ->()
//    func fold(_ player: inout Player) ->()
}

extension Playable {
    func draw(_ player: inout Player)  {
//        if let card = deck.cards.pop() {
//            player.hand.enQueue(card)
//        }
    }
}
