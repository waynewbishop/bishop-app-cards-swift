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
        
        //start the player turns
        self.nextTurn()
    }

    
    
    //TODO: deque the next player.
    func nextTurn() {
        if let next  = self.players.deQueue() {
            next.isTurn = true
        }
    }

    
    func score(of player: inout Player) -> Int {
        
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
    
    
    //TODO: Somehow, the game needs to send an aknowledgement that its a player's turn.
    //How can this be accomplished beyond a polling-based model? 
    
    //put down a card
    func play(_ player: inout Player, card: Card?) -> Turn  {
        
        //TODO: some gameplay goes here..

        
        //reset player to the back of the queue
        player.isTurn = false
        self.players.enQueue(item: player)

        
        //do some card analysis here..
        return Turn.match
    }
    

    
    func draw(_ player: inout Player) {
        //code goes here.
    }
    
    
    func hold() {
        
    }
    
    
    func call() -> Player? {
        //code goes here.
        return nil
    }

    
    func fold(_ player: inout Player) {
        //code goes here.
    }

    
}
