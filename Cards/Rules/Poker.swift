//
//  Poker.swift
//  Cards
//
//  Created by Wayne Bishop on 1/26/22.
//

import Foundation

//classic poker implementation goes here..
class Poker: Playable {
    
    let gameid = UUID()
    var dealer = Player(name: "dealer")
    var players = Queue<Player>() //represents an open socket to client players
    var discard = Array<Card>()
    var hasStarted: Bool = false
    var deck = Deck()
    var scoreboard = Set<Boarditem>()
    
    func start() {
        print("how poker starts is different than Blackjack..")
    }
    
}
