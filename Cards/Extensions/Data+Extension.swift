//
//  Data+Extension.swift
//  Cards
//
//  Created by Sam Warfield on 11/23/21.
//

import Foundation

extension Data {
    func decodeWebsocketMessage<T: Codable>(_ type: T.Type) -> WebsocketMessage<T>? {
        try? JSONDecoder().decode(WebsocketMessage<T>.self, from: self)
    }
}
