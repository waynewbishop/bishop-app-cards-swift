
//  Enums.swift
//  Cards
//
//  Created by Wayne Bishop on 11/11/21.
//

import Foundation


/*
 describes the action associated with the latest mutated state
 of TableMessage
 */


//player actions (that effect the card table)
enum Action: Codable {
    case start, new, deal, hit, hold, fold
}

//outcome of a player's calculated hand
enum Outcome: Codable {
    case bust, winner, safe, undecided
}

//game status - may not be required
enum Status: Codable {
    case waiting, started, active, completed
}

//the type of game being played
enum Game: Codable {
    case blackjack, hearts, poker, undecided
}
