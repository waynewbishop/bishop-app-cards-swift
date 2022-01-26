//
//  Blackjack.swift
//  Cards
//
//  Created by Wayne Bishop on 11/11/21.
//

import Foundation


class Blackjack_Old : Playable  {
    
    let gameid = UUID()
    var dealer = Player(with: "dealer")
    var players = Queue<Player>() //represents an open socket to client players
    var discard = Array<Card>()
    var hasStarted: Bool = false
    var deck = Deck()
    var scoreboard = Set<Boarditem>()
    
    
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
            
            //add each player's starting score
            let starting_score = self.score(of: p)
            self.scoreboard.insert(Boarditem(for: p, starting_score, gameid))
            
            //TODO: Should the Scoreboard be delegation design pattern??
            
            //what if they are served a winning hand?
            if starting_score == 21 {
                //todo: where and when am I serving this information?
                //where does this go?
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
    
    
    //TODO: Somehow, the game needs to send an acknowledgement that its a player's turn.
    //How can this be accomplished beyond a polling-based model?
    
    
    //player requests a card
    func hit(_ player: inout Player) -> Turn {
        
        
        if let card = deck.cards.pop() {
            player.hand.receive(card)
            
            //revise player score
            let new_score = self.score(of: player)
            self.scoreboard.insert(Boarditem(for: player, new_score, gameid))

            /*
             TODO: What happens to overall data-flow experience when
             someone is declared the winner,
             */
            
            
            if new_score == 21 {
                return .winner
            }
            
            else if new_score > 21 {
                return .bust
            }
            
            else {
                return .safe
            }
        }

        return .nocards
    }
        
    
}
