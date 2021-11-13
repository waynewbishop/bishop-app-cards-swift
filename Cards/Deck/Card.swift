//
//  Card.swift
//  Cards
//
//  Created by Sam Warfield on 11/5/21.
//

import Foundation

struct Card {
    enum Face {
        case up
        case down
    }
//    let id: Int
    let suit: Suit
    let score: Score
    
    var primaryValue: Int {
        score.primaryValue
    }
    
    var secondaryValue: Int {
        score.secondaryValue
    }
    
    var description: String {
        "\(suit.name) \(score.name)"
    }
}
 
extension Card: Comparable {
    static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.score.value < rhs.score.value
    }
    
    static public func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.score.value == rhs.score.value
        && lhs.score.secondary == rhs.score.secondary
    }
}

extension Card: Identifiable {
    var id: String {
        "\(suit.name) + \(score.name) + \(score.value)"
    }
}

extension Card: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
