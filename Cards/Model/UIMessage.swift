//
//  UIMessage.swift
//  Cards
//
//  Created by Wayne Bishop on 5/20/22.
//

import Foundation


//UI Level presentation

class UIMessage: ObservableObject {

  @Published var players = Queue<Player>()
  @Published var discard = Array<Card>()
  @Published var deck = Deck()
  @Published var holding = Stack<Player>()
  @Published var action = Action.start
  @Published var status = Status.waiting
                

    func handle(message: TableMessage, from: UUID?) {
        
        let rules: Playable?
        
        //todo: update all the players hands in the queue.
        //with the correct calculated score from the previous send..
        players = message.players
        
        //todo: complete adding score property to hand.
        /*
        if message.game == .blackjack {
            rules = BlackJack()
            for player in message.players.elements {
                player.hand.score = rules?.score(of: player)
         
                //the outcome of the player can also be determined at this spot as well
                //this is perfect because we can update the this data before sending it to SwiftUI..
            }
        }
        */
        
        discard = message.discard
        deck = message.deck
        action = message.action
        holding = message.holding
        action = message.action
        status = message.status
    }
    
    //test multiple users
    func testMultiUser() -> UIMessage {
        
        let testMessage = UIMessage()
        testMessage.players.enQueue(Player(name: "Sam Warfield"))
        testMessage.players.enQueue(Player(name: "Wayne Bishop"))
        testMessage.players.enQueue(Player(name: "Steve Jobs"))
        
        return testMessage
    }

    
    //test single user
    func testSingleUser() -> UIMessage {
        
        let testMessage = UIMessage()
        testMessage.players.enQueue(Player(name: "Ben Wong"))
        return testMessage
    }
}
