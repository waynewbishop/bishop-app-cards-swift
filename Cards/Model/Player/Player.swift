//
//  Player.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


//todo: update class to support equatable protocol. Will reduce code when comparing players

class Player: Codable, Equatable, Identifiable {
    
    let name: String
    var uuid = UUID()

    var participantUUID: UUID? //from GroupSession
    var hand = Hand()
    var isSpectator: Bool = false
    
    public init(name: String = "default") {
        self.name = name
    }
    
    //test primary and seconday scores
    static public func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.uuid == rhs.uuid
        && lhs.participantUUID == rhs.participantUUID
    }
    
}

            
