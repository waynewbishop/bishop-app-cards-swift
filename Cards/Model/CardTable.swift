//
//  CardTable.swift
//  Cards
//
//  Created by Wayne Bishop on 4/27/22.
//

import Foundation


class CardTable: ObservableObject {
    
    var players = Queue<Player>()
    var discard = Array<Card>()
    var deck = Deck()
    var hasStarted: Bool = false
    
    //todo: the card table implemented
    //as a singleton for other players
    //to receive a reference?
}
