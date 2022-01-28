//
//  Suit.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

public class Suit: Equatable {
    
    var name: String //e.g. hearts
    var scores = Array<Score>()
    
    //initialize names and values
    public init(of name: String = "") {
        
        self.name = name

        /*
        note: the model of each suit is based on the same type of
        generic model, each having the same rules and basis of
        comparision.
        */
        scores.append(Score("A", 1, 11))
        scores.append(Score("2", 2))
        scores.append(Score("3", 3))
        scores.append(Score("4", 4))
        scores.append(Score("5", 5))
        scores.append(Score("6", 6))
        scores.append(Score("7", 7))
        scores.append(Score("8", 8))
        scores.append(Score("9", 9))
        scores.append(Score("10", 10))

        //special support for general games + blackjack
        scores.append(Score("J", 11, 10))
        scores.append(Score("Q", 12, 10))
        scores.append(Score("K", 13, 10))
    }
    
    
    //test suit names
    static public func == (lhs: Suit, rhs: Suit) -> Bool {
        return lhs.name == rhs.name
    }
    
}
