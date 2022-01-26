//
//  Game.swift
//  Cards
//
//  Created by Wayne Bishop on 1/21/22.
//

import Foundation

class Game {
    
    let gameid = UUID()
    let type: Playable //conforms to all playable rules
    let scoreBoard = ScoreBoard()
    
    
    //initialization
    init(of type: Playable) {
        self.type = type
    }

    //starting the game
    func start() {
        type.start() //TODO: does this correctly invoke the blackjack implementation?
    }
    
    //perform actions based on game type
    func perform(action: GameAction, on playerid: UUID) {
        
        switch action {
        case .hit:
            type.hit(playerid)

        case .hold:
            print("invoke playable protocol")
            
        case .bust:
            print("invoke playable protocol")
            
        case .safe:
            print("invoke playable protocol")
        }
        
    } //end function
    
} //end class


