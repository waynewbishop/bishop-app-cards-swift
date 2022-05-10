//
//  Messages.swift
//  Cards
//
//  Created by Wayne Bishop on 5/5/22.
//

import Foundation
import SwiftUI

/*
 todo: here we will define the model to ahere to the
 Codeable protocol for sending and receiving messages..
 
 We should do a simple test first, the expand on it to
 fully support a complete Card representation..
 */


//how do we want the card object to be represented as a struct?
//what other additional metadata messages need to be distrubuted to other players (who is the active/next player), who won the game

struct CardMessage: Codable {
    //todo: this will manage the other codable types
    //of player, discard pile and deck..
}
