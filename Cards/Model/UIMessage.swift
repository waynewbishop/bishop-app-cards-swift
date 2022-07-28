//
//  UIMessage.swift
//  Cards
//
//  Created by Wayne Bishop on 5/20/22.
//

import Foundation


//UI Level presentation

class UIMessage: ObservableObject {

  @Published var players = Players()
  @Published var discard = Array<Card>()
  @Published var deck = Deck()
  @Published var action = Action.start
  @Published var status = GameStatus.waiting
  @Published var game = GameType.undecided //todo: this type needs to be removed..not required..
                

    func handle(message: TableMessage, from: UUID?) {
        
        players = message.players        
        discard = message.discard
        deck = message.deck
        action = message.action
        action = message.action
        status = message.status
        game = message.game
    }
    
    
    //test multiple users
    func testMultiUser() -> UIMessage {
        
        //set the status and points for these specific players
        
        let testMessage = UIMessage()
        
        testMessage.players.addActive(Player(name: "Sam Warfield"))
        testMessage.players.addActive(Player(name: "Wayne Bishop"))
        testMessage.players.addActive(Player(name: "Steve Jobs"))
        
        return testMessage
    }


    
    //test single user
    func testSingleUser() -> UIMessage {
        
        let testMessage = UIMessage()
        testMessage.players.addActive(Player(name: "Ben-Fong Torres"))
        return testMessage
    }
}
