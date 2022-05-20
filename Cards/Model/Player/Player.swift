//
//  Player.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation

//todo: player list is identifiable in order to generate a scoreboard..

class Player: Codable, Identifiable {
    
    let name: String
    var uuid = UUID()

    var participantUUID: UUID? //from GroupSession
    var hand = Hand()
    var score: Int = 0
    var isSpectator: Bool = true
    
    public init(name: String = "default") {
        self.name = name
    }
    
}

            
