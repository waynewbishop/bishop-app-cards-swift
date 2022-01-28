//
//  Server.swift
//  Cards
//
//  Created by Wayne Bishop on 1/21/22.
//

import Foundation


//group activity code goes here..
class GroupActivityMessenger: Messenger {
    func send() {
        print("now sending message via GroupActivity API")
    }
}



class WebsocketMessenger: Messenger {
    func send() {
       print("now sending message via WebSocket API")
    }
}


class LocalMessenger: Messenger {
    func send() {
        print("now sending a message via local app code..")
    }
}


class Server {
    
    var messenger: Messenger
    var games = Array<Game>()
    
    
    init (of game: Game, messenger: Messenger) {
        self.games.append(game)
        self.messenger = messenger
    }

    
    //manage incoming messages
    func receive(message: Message) {
        
        let gameID = message.gameID
        let playerID = message.playerID
        let action = message.action
        
        //find the matching game
        if let game = games.first(where: { $0.gameid == gameID} ) {
            game.perform(action: action, on: playerID)
        }        
    }
    
    //send generic message
    
    func send() {
        messenger.send()
    }
    
    
} //end class

