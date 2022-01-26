//
//  Message.swift
//  Cards
//
//  Created by Wayne Bishop on 1/26/22.
//

import Foundation

//the communication component between player, game and server

struct Message: Codable {
    
    let gameID: UUID
    let playerID: UUID
    let action: GameAction
}
