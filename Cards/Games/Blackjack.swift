//
//  Blackjack.swift
//  Cards
//
//  Created by Wayne Bishop on 11/11/21.
//

import Foundation


class Blackjack : Playable  {
    
    let gameid = UUID()
    var dealer = Player(with: "dealer")
    var players = Queue<Player>() //represents an open socket to client players
    var discard = Array<Card>()
    var hasStarted: Bool = false
    var deck = Deck()

    
    init() {
        //add dealer to list of players - 1st player
        dealer.isDealer = true
        self.addPlayer(&dealer)
    }
    
    
    //MARK: Playable protocol conformance
    
    func addPlayer(_ newPlayer: inout Player) {
        if self.hasStarted == false {
            players.enQueue(item: newPlayer)
        }
    }
    
    
    //randomize the deck
    func start() {
        
        //shuffle the deck
        deck.shuffle()
    
        
        //deal cards to all players
        for p in players.elements {
            
            //assign two cards per player
            for _ in 0..<2 {
                if let card = deck.cards.pop() {
                    card.faceup = true
                    p.hand.receive(card)
                }
            }
        }

        
        self.hasStarted = true
        
    }


    
    func score(of player: inout Player) -> Int {
        
        //gets computed as the hand changes.. - blackjack
        var total: Int = 0
        
        //TODO: Need to provide more detail
        //add to total if the range is between 2 and 10
        //add 10 points if range is between 11 and 13
        //if players hand contains an ace and total is less than 10 then add 11
        //if players hand contains an ace and total is greater than 10 then add 1
        
        
        for s in player.hand.cards {
            total += s.score.value
        }
        
        return total
        
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
