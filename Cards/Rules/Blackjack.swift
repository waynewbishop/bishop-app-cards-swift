//
//  Blackjack.swift
//  Cards
//
//  Created by Wayne Bishop on 1/26/22.
//

import Foundation

//defining rules for blackjack

protocol Blackjack {
 
    func nextTurn() -> ()
    func hit(_ playerID: UUID)
    func hold(_ playerID: UUID)
}

//extension on protocol - implementation
extension Blackjack {
    
    func hit(_ playerID: UUID) {
      print("now requesting a new card in blackjack..")
    }
    
    func hold(_ playerID: UUID) {
      print("now holding in blackjack..")
    }
    
    func deal() {
      print("now dealing in blackjack..")
    }
}

