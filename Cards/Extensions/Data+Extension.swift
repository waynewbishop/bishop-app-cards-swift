//
//  Data+Extension.swift
//  Cards
//
//  Created by Sam Warfield on 11/23/21.
//

import Foundation

extension Data {
    func decodeWebsocketMessage<T: Codable>(_ type: T.Type) -> ClientMessage<T>? {
        try? JSONDecoder().decode(ClientMessage<T>.self, from: self)
    }
}
