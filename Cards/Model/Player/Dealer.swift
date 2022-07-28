//
//  Dealer.swift
//  Cards
//
//  Created by Wayne Bishop on 7/22/22.
//

import Foundation


protocol Dealerable: Decodable {
    var uuid: UUID { get }
//    var delegate: GameDelegate? { get set }
    
    //decision tree definition goes here..
}

class BlackJackDealer: Player, Dealerable {

//    weak var delegate: GameDelegate?
    
    
    // special stuff for blackjack
}

//class PokerDealer: Player, Dealerable {
//    // speciall stuff for poker
//}
