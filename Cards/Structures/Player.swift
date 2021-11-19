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
    var isDealer: Bool = false
    var isTurn: Bool = false

    
    /// Assign player name
    /// - Parameter name: The name of the player
    /// 
    public init(with name: String) {
        self.name = name
    }
        
    
    /// Provides details on showing a players hand
    /// - Returns: array of cards - optional
    
    public func showHand() -> Array<Card>? {
        return hand.show()
    }
    
    
    /// Play the selected card based on index
    /// - Returns: the card to played - optional

    public func play(index: Int) -> Card?  {
        return hand.play(index)
    }
    
}

            
