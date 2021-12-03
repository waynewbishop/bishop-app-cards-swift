//
//  CardGameMessage.swift
//  Cards
//
//  Created by Sam Warfield on 11/24/21.
//

import Foundation

struct CardGameMessage: Codable {
    let id: UUID
    let gameID: UUID?
}
