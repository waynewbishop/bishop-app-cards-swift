//
//  Scoreboard.swift
//  Cards
//
//  Created by Wayne Bishop on 1/20/22.
//

import Foundation

//indivdual objects that comprise the scoreboard

class Boarditem: Hashable {
    
   private var gameid: UUID
   private var player: Player
   private var score: Int = 0
    
    
    //default initalization
    init(for player: Player, _ score: Int, _ gameid: UUID) {
        
        self.player = player
        self.score = score
        self.gameid = gameid
    }

    
    func update(score: Int) {
        self.score = score
    }
    
    //hashable conformance
    public func hash(into hasher: inout Hasher) {
        hasher.combine(player.uuid)
    }
    
    //equatable conformance
    public static func == (lhs: Boarditem, rhs: Boarditem) -> Bool {
        return lhs.player.uuid == rhs.player.uuid
    }

}


