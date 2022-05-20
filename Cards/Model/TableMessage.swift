//
//  Messages.swift
//  Cards
//
//  Created by Wayne Bishop on 5/5/22.
//

import Foundation
import SwiftUI


/// model definition for sending and recieving messages
class TableMessage: Codable, ObservableObject {
    
   var players = Queue<Player>() //todo: these objects need to be @published
   var discard = Array<Card>()
   var deck = Deck()
   var action = Action.start
   var holding = Stack<Player>()
    
}
