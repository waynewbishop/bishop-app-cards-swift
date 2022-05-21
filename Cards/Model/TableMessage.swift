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
    var action = Action.start
    var holding = Stack<Player>()
}

