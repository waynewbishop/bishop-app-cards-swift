//
//  BlackjackLocal.swift
//  Cards
//
//  Created by Sam Warfield on 11/22/21.
//

import Foundation
import CardDeck
import Combine

final class Player {
    let id = UUID()
    let name: String
    @Published private(set) var hand: Hand
    
    var score: Int {
        hand.score
    }
    
    init(name: String,
         hand: Hand = Hand()) {
        self.name = name
        self.hand = hand
    }
    
    func new(_ hand: Hand) {
        self.hand = hand
    }
}

extension Player: Identifiable {
    
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
}
