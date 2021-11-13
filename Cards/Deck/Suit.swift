//
//  Suit.swift
//  Cards
//
//  Created by Sam Warfield on 11/5/21.
//

import Foundation

struct Suit {
    let name: String
    var scores = Array<Score>()
    
    init(of name: String = "") {
        
        self.name = name
        
        /*
         note: the model of each suit is based on the same type of
         generic model, each having the same rules and basis of
         comparision.
         */
        
        scores.append(Score(name: "A", value: 1, secondary: 11))
        scores.append(Score(name: "2", value: 2, secondary: nil))
        scores.append(Score(name: "3", value: 3, secondary: nil))
        scores.append(Score(name: "4", value: 4, secondary: nil))
        scores.append(Score(name: "5", value: 5, secondary: nil))
        scores.append(Score(name: "6", value: 6, secondary: nil))
        scores.append(Score(name: "7", value: 7, secondary: nil))
        scores.append(Score(name: "8", value: 8, secondary: nil))
        scores.append(Score(name: "9", value: 9, secondary: nil))
        scores.append(Score(name: "10", value: 10, secondary: nil))
        scores.append(Score(name: "J", value: 11, secondary: nil))
        scores.append(Score(name: "Q", value: 12, secondary: nil))
        scores.append(Score(name: "K", value: 13, secondary: nil))
    }
}
 
extension Suit: Equatable {
    static public func == (lhs: Suit, rhs: Suit) -> Bool {
        return lhs.name == rhs.name
    }
    
}
