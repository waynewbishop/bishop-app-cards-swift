//
//  Suit.swift
//  Cards
//
//  Created by Sam Warfield on 11/5/21.
//

import Foundation

struct Suit {
    let name: String
    let scores: [Score] = [
        Score(name: "A", value: 1, secondary: 11),
        Score(name: "2", value: 2, secondary: nil),
        Score(name: "3", value: 3, secondary: nil),
        Score(name: "4", value: 4, secondary: nil),
        Score(name: "5", value: 5, secondary: nil),
        Score(name: "6", value: 6, secondary: nil),
        Score(name: "7", value: 7, secondary: nil),
        Score(name: "8", value: 8, secondary: nil),
        Score(name: "9", value: 9, secondary: nil),
        Score(name: "10", value: 10, secondary: nil),
        Score(name: "J", value: 10, secondary: nil),
        Score(name: "Q", value: 10, secondary: nil),
        Score(name: "K", value: 10, secondary: nil)
    ]
}

extension Suit: Equatable {
    static public func == (lhs: Suit, rhs: Suit) -> Bool {
        return lhs.name == rhs.name
    }
}
