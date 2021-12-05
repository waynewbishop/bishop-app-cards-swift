//
//  ClientMessage.swift
//  Cards
//
//  Created by Sam Warfield on 12/5/21.
//

import Foundation

struct ClientMessage<T: Codable>: Codable {
    let gameID: UUID
    let data: T
}
