//
//  Card.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


public class Card : Comparable, Codable {
   
   var id = UUID() //individual cards
   var suit: Suit
   var unit: Unit
   var wildcard: Bool = false
   var faceup: Bool = false

    var name: String? {
        return self.unit.name
    }
   
   public init() {
       self.suit = Suit()
       self.unit = Unit()
   }
           
   
   static public func <(lhs: Card, rhs: Card) -> Bool {
       return lhs.unit.value < rhs.unit.value
   }
   
   //test primary and seconday scores
   static public func == (lhs: Card, rhs: Card) -> Bool {
       return lhs.unit.value == rhs.unit.value
           && lhs.unit.secondary == rhs.unit.secondary
   }
   
}
