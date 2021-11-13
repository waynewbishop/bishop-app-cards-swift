//
//  Score.swift
//  Cards
//
//  Created by Sam Warfield on 11/5/21.
//

import Foundation

struct Score {
    let name: String
    let value: Int
    let secondary: Int?
    
    var primary: Int {
        value
    }
    
    var secondaryValue: Int {
        secondary ?? primary
    }
}
 
extension Score: Equatable {
    static public func == (lhs: Score, rhs: Score) -> Bool {
        return lhs.value == rhs.value
        && lhs.secondary == rhs.secondary
    }
}
