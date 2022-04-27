
//  Enums.swift
//  Cards
//
//  Created by Wayne Bishop on 11/11/21.
//

import Foundation


enum GameAction: Codable {
    case hit, hold, bust, safe
}

/// Governs types card game moves (deck of cards)

enum Turn {
    case match, nomatch, draw, hit, hold, bust, safe, winner, nocards
}


// Tracks status of each game

enum Status {
    case started, active, completed
}
