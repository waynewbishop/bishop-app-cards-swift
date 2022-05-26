//
//  Score.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


///  Serves as the basis of comparsion for generic cards.

class Unit : Equatable, Codable {
    
    var name: String? //A
    var value: Int  //1
    var secondary: Int?  //11

    public init(_ name: String? = nil, _ value: Int = 0, _ secondary: Int? = nil) {
        
        self.name = name
        self.value = value
        self.secondary = secondary
    }
    
    
    //test primary and seconday scores
    static public func == (lhs: Unit, rhs: Unit) -> Bool {
        return lhs.value == rhs.value
            && lhs.secondary == rhs.secondary
    }
        
}
