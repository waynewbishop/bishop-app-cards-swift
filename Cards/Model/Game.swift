//
//  Game.swift
//  Cards
//
//  Created by Wayne Bishop on 7/16/22.
//

import Foundation

protocol GameDelegate: AnyObject {
    
    func willReceiveMessage(message: TableMessage)
    func willReceiveResponse(response: String)
}


class Game {
    
    weak var delegate: GameDelegate?
    
    var localPlayer = Player()
    var tMessage = TableMessage()
    var rules: Playable?
    
        
    //who's the current player
    var current: Player? {
        guard let player = tMessage.players.peek else {
            return nil
        }
        return player
    }

    
    
    var isMyTurn: Bool {
        if let current = self.current {
            if current == localPlayer {
                return true
            }
        }
        else {
            return false
        }
        return false
    }

    
    //set the game rules
    func setRules(rulebook: Playable) {
        self.rules = rulebook
    }
    
    
    func addLocalPlayer(with participantUUID: UUID) {
        
        /*
         todo: determine if the game has already started
         if so, the player as added to the waiting players queue..
         */
        
        localPlayer.participantUUID = participantUUID        
        tMessage.players.enQueue(localPlayer)
        tMessage.action = .new
        
        
        if let delegate = delegate {
            delegate.willReceiveMessage(message: tMessage)
            delegate.willReceiveResponse(response: localPlayer.name + " just joined session..")
        }        
    }

 
    
//MARK: game actions
    
    
    //deal initial cards
    func deal() {

        
        guard tMessage.players.count > 1 else {
            return
        }
        
        guard let delegate = self.delegate else {
            return
        }
        
        guard let rule = self.rules else {
            delegate.willReceiveResponse(response: "Error: game rules not defined..")
            return
        }
        
                        
        tMessage.deck.shuffle()
            
        //deal cards to all players
        for p in tMessage.players.elements {
            
            //assign two cards per player
            for _ in 0..<rule.cardsToDeal {
                if let card = tMessage.deck.cards.pop() {
                    card.faceup = true
                    p.hand.receive(card)
                }
            }
            

            p.hand.score = rule.score(of: p)
            p.outcome = rule.evaluate(player: p)

        }
        
        
        //update status and action
        tMessage.action = .deal
        tMessage.status = .active
                

        delegate.willReceiveMessage(message: tMessage)
        delegate.willReceiveResponse(response: "dealing cards to players..")
    }
    
    
    
    //receive a card
    func hit() {
        
        guard tMessage.players.count > 1 else {
            return
        }
        
        guard let delegate = self.delegate else {
            return
        }
        
        guard let rule = self.rules else {
            delegate.willReceiveResponse(response: "Error: game rules not defined..")
            return
        }
        
        let p = self.localPlayer
        
        
        if self.isMyTurn == true {
            if let card = tMessage.deck.cards.pop() {
                
                p.hand.receive(card)
                tMessage.action = .hit

                
                p.hand.score = rule.score(of: p)
                localPlayer.outcome = rule.evaluate(player: p)

                
                _ = tMessage.players.deQueue()
                 tMessage.players.enQueue(p)

                
                delegate.willReceiveResponse(response: "hit button pressed..")
                delegate.willReceiveMessage(message: tMessage)
             }
        }
    }
    
    
    
    
    //they are remove as active players for the current session
    func hold() {
        
        guard tMessage.players.count > 1 else {
            return
        }
        
        guard let delegate = self.delegate else {
            return
        }

        /*
         they are moved from active to waiting players
         queue status
         */
        
        
        if let current = self.current {
            if isMyTurn == true {
                current.outcome = .hold
            }
        }

         /*
         note: if they fold they are out of the game but are still
         connected to the shareplay session.
         */
        
        tMessage.action = .fold
        delegate.willReceiveMessage(message: tMessage)
    }
    
}
