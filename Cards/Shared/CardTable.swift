//
//  CardTable.swift
//  
//
//  Created by Sam Warfield on 11/24/21.
//

import Foundation
import CardDeck

struct CardTable: Codable {
    let dealerHand: Hand
    let playerHand: Hand
}
