//
//  Messages.swift
//  Cards
//
//  Created by Wayne Bishop on 5/5/22.
//

import Foundation
import Combine


/// model definition for sending and recieving messages - network level
struct TableMessage: Codable {
    
    var players = Queue<Player>()
    var discard = Array<Card>()
    var deck = Deck()
    var holding = Stack<Player>()
    var action = Action.start
    var game = Status.waiting
}



func testData() -> TableMessage {
    
    let testMessage = TableMessage()
    
    testMessage.players.enQueue(Player(name: "Sam Warfield"))
    testMessage.players.enQueue(Player(name: "Wayne Bishop"))
    testMessage.players.enQueue(Player(name: "Steve Jobs"))
    
    return testMessage
}
