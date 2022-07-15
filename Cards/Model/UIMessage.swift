//
//  UIMessage.swift
//  Cards
//
//  Created by Wayne Bishop on 5/20/22.
//

import Foundation


//UI Level presentation


/// Game Player Manager
class Players: Codable {
    private var activePlayers = Queue<Player>()
    private var dealer: Player? //todo: the dealer may or may not be in the player's queue..
    private var waitingPlayers: [Player] = []
    
    var nextPlayer: Player? {
        activePlayers.peek
    }
    
    var count: Int {
        activePlayers.count
    }
    
    //updates the player
    func dealer(is player: Player) {
        guard self.dealer == nil else {
            return
        }
        
        self.dealer = player
    }
    
    func add(player: Player) {
        activePlayers.enQueue(player)
    }
    
    func remove(player: Player) -> Player? {
        activePlayers.remove(element: player)
    }
}

class UIMessage: ObservableObject {

  @Published var foo = Players()
  @Published var players = Queue<Player>()
  @Published var discard = Array<Card>()
  @Published var deck = Deck()
  @Published var action = Action.start
  @Published var status = GameStatus.waiting
  @Published var game = GameType.undecided
                

    func handle(message: TableMessage, from: UUID?) {
        
        players = message.players        
        discard = message.discard
        deck = message.deck
        action = message.action
        action = message.action
        status = message.status
        game = message.game
    }
    
    //test multiple users
    func testMultiUser() -> UIMessage {
        
        //set the status and points for these specific players
        
        let testMessage = UIMessage()
        testMessage.players.enQueue(Player(name: "Sam Warfield"))
        testMessage.players.enQueue(Player(name: "Wayne Bishop"))
        testMessage.players.enQueue(Player(name: "Steve Jobs"))
        
        return testMessage
    }

    
    //test single user
    func testSingleUser() -> UIMessage {
        
        let testMessage = UIMessage()
        testMessage.players.enQueue(Player(name: "Ben-Fong Torres"))
        return testMessage
    }
}
