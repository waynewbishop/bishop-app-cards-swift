//
//  Blackjack.swift
//  Cards
//
//  Created by Sam Warfield on 11/7/21.
//

import Foundation

class Blackjack: Playable {
    var players = Array<Player>()
    var deck = Deck()
    var discard = Array<Card>()
    var hasStarted: Bool = false
    
    func start() {
        deck.shuffle()
        self.hasStarted = true
    }
    
    func deal(_ player: inout Player) {
//        for _ in 0..<2 {
//            if let card = deck.cards.pop() {
//                player.hand.enQueue(card)
//            }
//        }
    }
    
    func play(_ player: inout Player, card: Card?) -> Turn  {
        //do some card analysis here..
        return Turn.match
    }
    
    func fold(_ player: inout Player) {
        //code goes here..
    }
    
    //analyze and complete game
    func call() -> Player? {
        return nil
    }
}
