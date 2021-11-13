//
//  Dealer.swift
//  Cards
//
//  Created by Sam Warfield on 11/7/21.
//

import Foundation

struct Dealer {
    private(set) var deck: Deck
    
    mutating func dealCard() -> Card? {
        deck.draw()
    }
}
