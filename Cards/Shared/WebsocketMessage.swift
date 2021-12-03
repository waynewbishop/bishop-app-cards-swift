//
//  WebsocketMessage.swift
//  Cards
//
//  Created by Sam Warfield on 11/22/21.
//

import Foundation

struct WebsocketMessage<T: Codable>: Codable {
    let playerID: UUID
    let gameID: UUID
    let data: T
}
