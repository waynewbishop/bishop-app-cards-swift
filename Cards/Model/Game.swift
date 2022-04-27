//
//  Blackjack.swift
//  Cards
//
//  Created by Wayne Bishop on 11/11/21.
//

import Foundation

class Game: Player  {
    
    let gameid = UUID()
    var dealer = Player()
    var players = Queue<Player>()  //todo: needs to be moved to the card table.
    var discard = Array<Card>() //todo: needs to be moved the card table
    var hasStarted: Bool = false
    var deck = Deck() //todo: needs to be moved to the card table
        
    init() {
        
    }
 
    
    //MARK: playable protocol conformance
    
    func addPlayer(_ newPlayer: inout Player) {
        if self.hasStarted == false {
            players.enQueue(newPlayer)
        }
    }
    
    
    //randomize the deck
    func start() { //todo: does this reside at this level? Card Table?
        
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
        
        //start the player turns
        self.nextTurn()
    }

    
    
    func nextTurn() {
        if let next  = self.players.deQueue() {
            next.isTurn = true
        }
    }

    
    func score(of player: Player) -> Int {
        
        //gets computed as the hand changes.. - blackjack
        var total: Int = 0
        let number_range = 2...10
        let face_range = 11...13
        var hasAce: Bool = false  //TODO: Change this to an Int?
                
        for card in player.hand.cards {
            
            if card.score.value == 1 {
                hasAce = true
            }
            
            //add to total if the range is between 2 and 10
            if number_range.contains(card.score.value) {
                total += card.score.value
            }
            
            //add 10 points if range is between 11 and 13
            if face_range.contains(card.score.value) {
                if let secondary = card.score.secondary {
                    total += secondary
                }
            }
        }        
        
        //TODO: Add back the ace(s) one at a time and recalculate..
        
        //add conditional rules for holding an ace
        if hasAce == true {
            if (total <= 10) {
                total += 11 //secondary ace value
            }
            else {
                total += 1 //primary ace value
            }
        }
                
        
        return total
    }
    
    
    
            
}
