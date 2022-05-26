//
//  Suit.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

public class Suit: Equatable, Codable {
    
    var name: String //e.g. hearts
    var units = Array<Unit>()
    
    //initialize names and values
    public init(of name: String = "") {
        
        self.name = name

        /*
        note: the model of each suit is based on the same type of
        generic model, each having the same rules and basis of
        comparision.
        */
        units.append(Unit("A", 1, 11))
        units.append(Unit("2", 2))
        units.append(Unit("3", 3))
        units.append(Unit("4", 4))
        units.append(Unit("5", 5))
        units.append(Unit("6", 6))
        units.append(Unit("7", 7))
        units.append(Unit("8", 8))
        units.append(Unit("9", 9))
        units.append(Unit("10", 10))

        //special support for general games + blackjack
        units.append(Unit("J", 11, 10))
        units.append(Unit("Q", 12, 10))
        units.append(Unit("K", 13, 10))
    }
    
    
    //test suit names
    static public func == (lhs: Suit, rhs: Suit) -> Bool {
        return lhs.name == rhs.name
    }
    
}
