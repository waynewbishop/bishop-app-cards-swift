//
//  GameType.swift
//  Cards
//
//  Created by Sam Warfield on 11/7/21.
//

import Foundation

struct GameType {
    struct Hearts {
        enum Turn {
            case match, nomatch, draw
        }
    }
    struct BlackJack {
        enum Turn {
            case hit, hold
        }
    }
}
