
//  Enums.swift
//  Cards
//
//  Created by Wayne Bishop on 11/11/21.
//

import Foundation


//the type of game being played
enum GameType: String, Codable, CaseIterable, Identifiable {
    case Blackjack, Poker, Hearts, undecided
    var id: Self { self }
}

//player actions (that effect the card table)
enum Action: Codable {
    case start, new, deal, hit, hold, fold
}

//outcome of a player's calculated hand
enum Outcome: Codable {
    case bust, winner, safe, hold, fold, undecided
}


//game status - may not be required
enum GameStatus: Codable {
    case waiting, started, active, completed
}
