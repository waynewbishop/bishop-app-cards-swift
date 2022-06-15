//
//  Messages.swift
//  Cards
//
//  Created by Wayne Bishop on 5/5/22.
//

import Foundation
import Combine


/// model definition for sending and recieving messages - network level
/// todo: is there a 64KB file size limit on messages? what is our current footprint? 
struct TableMessage: Codable {
    
    var players = Queue<Player>()
    var discard = Array<Card>()
    var deck = Deck()
    var holding = Stack<Player>()
    var action = Action.start
    var status = Status.waiting
    var game = Game.undecided
    
}



func testData() -> TableMessage {
    
    let testMessage = TableMessage()
    
    testMessage.players.enQueue(Player(name: "Sam Warfield"))
    testMessage.players.enQueue(Player(name: "Wayne Bishop"))
    testMessage.players.enQueue(Player(name: "Steve Jobs"))
    
    return testMessage
}
