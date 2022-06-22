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
  @Published var status = GameStatus.waiting
                

    func handle(message: TableMessage, from: UUID?) {
        
        players = message.players        
        discard = message.discard
        deck = message.deck
        action = message.action
        holding = message.holding
        action = message.action
        status = message.status
    }
    
    //test multiple users
    func testMultiUser() -> UIMessage {
        
        //set the status and points for these specific players
        
        let testMessage = UIMessage()
        testMessage.players.enQueue(Player(name: "Sam Warfield"))
        testMessage.players.enQueue(Player(name: "Wayne Bishop"))
        testMessage.players.enQueue(Player(name: "Steve Jobs"))
        
        return testMessage
    }

    
    //test single user
    func testSingleUser() -> UIMessage {
        
        let testMessage = UIMessage()
        testMessage.players.enQueue(Player(name: "Ben-Fong Torres"))
        return testMessage
    }
}
