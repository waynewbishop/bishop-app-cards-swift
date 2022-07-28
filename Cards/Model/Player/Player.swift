//
//  Player.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


class Player: Codable, Equatable, Identifiable {
    
    var name: String
    var uuid = UUID()
    var hand = Hand()
    var outcome = Outcome.undecided
    
//    var isDealer: Bool {
//        self is Dealerable
//    }

    var participantUUID: UUID? //from GroupSession
    

    public init(name: String = "default") {
        self.name = name
    }

    
    static public func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.uuid == rhs.uuid
        && lhs.participantUUID == rhs.participantUUID
    }
    
}


extension Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        lhs.hand.score > rhs.hand.score
    }
}
