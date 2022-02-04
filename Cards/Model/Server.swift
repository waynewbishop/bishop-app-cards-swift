//
//  Server.swift
//  Cards
//
//  Created by Wayne Bishop on 1/21/22.
//

import Foundation


//group activity code goes here..
class GroupActivityMessenger: Messenger {
    
    init() {
        print("now initializing group activity api..")
    }
    
    func send() {
        print("now sending message via GroupActivity API")
    }
    
    func receive() {
      //<#code#>
    }
    
    func disconnect() {
      //  <#code#>
    }

    
    func connect() {
        Task {
            do {
                _ = try await Cards().activate()
            } catch {
                print("Failed to activate Cards group activity: \(error)")
            }
        }
    }
    
}



class WebsocketMessenger: Messenger {
    func receive() {
      //  <#code#>
    }
    
    func disconnect() {
      //  <#code#>
    }
    
    func send() {
       print("now sending message via WebSocket API")
    }
    
    func connect() {
        //code goes here..
    }
}


class Server {
    
    var messenger: Messenger
    var game: Game
    
    
    init (of game: Game, messenger: Messenger) {
        self.game = game
        self.messenger = messenger
        self.messenger.connect()
        Cards.sessions()
    }

    
    //manage incoming messages
    func receive(message: Message) {
        
        let playerID = message.playerID
        let action = message.action
        
        game.perform(action: action, on: playerID)
    }
    
    //send generic message
    
    func send() {
        messenger.send()
    }
    
    
} //end class

