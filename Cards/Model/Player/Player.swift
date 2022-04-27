//
//  Player.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

class Player {
    
    let name: String
    let uuid = UUID()
    var hand = Hand()
    var isDealer: Bool = false //todo: goes away..
    var isTurn: Bool = false //todo: goes away..
    var isSpectator: Bool = true

    
    public init(name: String = "default") {
        self.name = name
    }

    
    public func newGame() {  //todo: pass the game type as a parameter...
        
        //invokes function to create CardTable instance..

        //new game
      //  let blackjack = Blackjack()
      //  let game = Game()
    //    let groupActivityMessenger = GroupActivityMessenger()
        
    }

    
    
    /*
     Note: how these functions organized are incorrect.
     The app needs to be written from the perspective of
     the player since they will be invoking the actions (e.g. hit, hold, bust, safe).
     The player sends the requests to the server 
     */
    
}

            
