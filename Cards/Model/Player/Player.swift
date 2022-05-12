//
//  Player.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

class Player: Codable {
    
    let name: String
    var uuid = UUID()
    var hand = Hand()
    var isSpectator: Bool = true

    
    public init(name: String = "default") {
        self.name = name
    }

    
}

            
