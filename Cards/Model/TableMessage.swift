//
//  Messages.swift
//  Cards
//
//  Created by Wayne Bishop on 5/5/22.
//

import Foundation
import SwiftUI


//how do we want the card object to be represented as a struct?
//what other additional metadata messages need to be distrubuted to other players (who is the active/next player), who won the game


/// define the model for sending and recieving messages
struct TableMessage: Codable {
    
    var players = Queue<Player>()
    var discard = Array<Card>()
    var deck = Deck()
}
