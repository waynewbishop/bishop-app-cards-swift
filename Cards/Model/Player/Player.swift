//
//  Player.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

class Player {
    
    var server: Server?
    let name: String
    let uuid = UUID()
    var hand = Hand()
    var isDealer: Bool = false
    var isTurn: Bool = false

    
    public init(name: String = "default") {
        self.name = name
    }

    
    public func newGame() {

        //new game
        let blackjack = Blackjack()
        let game = Game(of: blackjack)
        let groupActivityMessenger = GroupActivityMessenger()
        
        //new server
        self.server = Server(of: game, messenger: groupActivityMessenger)
        
        /*
         todo: with the new server composed, players compose messages
         which are sent to the server.
         */
    }

    
    
    /*
     Note: how these functions organized are incorrect.
     The app needs to be written from the perspective of
     the player since they will be invoking the actions (e.g. hit, hold, bust, safe).
     The player sends the requests to the server 
     */
    
}

            
