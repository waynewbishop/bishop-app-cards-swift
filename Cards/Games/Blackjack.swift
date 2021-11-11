//
//  Blackjack.swift
//  Cards
//
//  Created by Wayne Bishop on 11/11/21.
//

import Foundation


class Blackjack : Playable  {
    
    var players = Array<Player>()  //represents an open socket to client players
    var deck = Deck()
    var discard = Array<Card>()
    var hasStarted: Bool = false
    var dealer = Player(with: "dealer")
    
    //MARK: Playable protocol conformance
    
    
    //randomize the deck
    func start() {
        
        deck.shuffle()
        self.hasStarted = true
        dealer.isDealer = true
        
        //TODO: the deal method needs to be initialized automatically through the game start
        //this is done by updating the reference to the players collection with the new cards.
        
    }

    
    //deal cards to player
    func deal(_ player: inout Player) {

        var cards_received = Array<Card>()
        
        //assign two cards to the designated player
        for _ in 0..<2 {
            if let c = deck.cards.pop() {
                c.faceup = true
                cards_received.append(c)
            }
        }
    
        
        //player receives cards - single push
        player.hand.receive(cards: cards_received)
    }
    

    
    //put down a card
    func play(_ player: inout Player, card: Card?) -> Turn  {
        
        //do some card analysis here..
        return Turn.match
    }
    
    
    
    func call() -> Player? {
        //code goes here.
        return nil
    }
    
    func draw(_ player: inout Player) {
        //code goes here.
    }
    
    func fold(_ player: inout Player) {
        //code goes here.
    }

    
}
