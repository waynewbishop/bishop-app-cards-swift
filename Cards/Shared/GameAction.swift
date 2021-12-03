//
//  GameAction.swift
//  Cards
//
//  Created by Sam Warfield on 11/22/21.
//

import Foundation

struct GameAction: Codable {
    enum Action: Codable {
        case reset
        case newGame
        case bet
        case split
        case hit
        case stand
    }
    
    let action: Action
}
