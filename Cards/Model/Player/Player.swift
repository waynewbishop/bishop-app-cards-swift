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

    //todo: the player needs to hold their own cards
    //for this to work..
    
    public init(name: String = "default") {
        self.name = name
    }
        
    
    /// Provides details on showing a players hand
    /// - Returns: array of cards - optional
    
    public func showHand() -> Array<Card>? {
        return hand.show()
    }
    
    /*
     Note: how these functions organized are incorrect.
     The app needs to be written from the perspective of
     the player since they will be invoking the actions (e.g. hit, hold, bust, safe).
     The player sends the requests to the server 
     */
    
    /// Play the selected card based on index
    /// - Returns: the card to played - optional

    public func play(index: Int) -> Card?  {
        return hand.play(index)
    }
    
}

            
