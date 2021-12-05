//
//  ServerMessage.swift
//  Cards
//
//  Created by Sam Warfield on 11/22/21.
//

import Foundation

struct ServerMessage<T: Codable>: Codable {
    let playerID: UUID
    let gameID: UUID
    let data: T
}
