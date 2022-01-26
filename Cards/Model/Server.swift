//
//  Server.swift
//  Cards
//
//  Created by Wayne Bishop on 1/21/22.
//

import Foundation

class Server {
    
    //add playable games
    var games = Array<Game>()

    
    //add new games
    func newgame(_ game: Game) {
        self.games.append(game)
    }
    
    //manage incoming messages
    func incoming(message: Message) {
        
        let gameID = message.gameID
        let playerID = message.playerID
        let action = message.action
        
        //find the matching game
        if let game = games.first(where: { $0.gameid == gameID} ) {
            game.perform(action: action, on: playerID)
        }
        
    } //end function
    
} //end class

