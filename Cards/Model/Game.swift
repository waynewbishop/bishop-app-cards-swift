//
//  Game.swift
//  Cards
//
//  Created by Wayne Bishop on 1/21/22.
//

import Foundation

class Game {
        
    let gameid = UUID()
    let playbook: Playable
    var scoreBoard = ScoreBoard()
    
    init(of playbook: Playable) {
        self.playbook = playbook
    }

    
    //start game depending on playbook
    func start() -> () {
        playbook.start()
    }

    
    //perform actions based on game type
    func perform(action: GameAction, on playerid: UUID) {
                
        switch action {
        case .hit:
            print("invoke blackjack protocol")

        case .hold:
            print("invoke blackjack protocol")
            
        case .bust:
            print("invoke blackjack protocol")
            
        case .safe:
            print("invoke blackjack protocol")
        }
        
        
    } //end function
    
} //end class


