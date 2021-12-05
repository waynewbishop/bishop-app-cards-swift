//
//  Blackjack.swift
//  Cards
//
//  Created by Sam Warfield on 11/23/21.
//

import Foundation
import CardDeck

class Blackjack: WebSocketClient {
    @Published private(set) var gameID: UUID?
    @Published private(set) var dealerHand = Hand()
    @Published private(set) var currentTurnPlayerID: UUID?
    
    private(set) var player: Player
    
    init(player: Player) {
        self.player = player
    }
    
    func start() {
        connect()
        join(gameID: UUID())
        bet()
    }
    
    func join(gameID: UUID) {
        self.gameID = gameID
        let connect = Connect(connect: true)
        send(data: connect)
    }
    
    func bet() {
        send(action: .bet)
    }
    
    func hit() {
        send(action: .hit)
    }
    
    func stand() {
        send(action: .stand)
    }
    
    func reset() {
        send(action: .reset)
    }
    
    // Websocket
    override func received(_ data: Data) {
        print("\(String(data: data, encoding: .utf8) ?? "none")")
        if let msg = data.decodeWebsocketMessage(CardTable.self) {
            let table = msg.data
            self.dealerHand = table.dealerHand
            self.player.new(table.playerHand)
        }
        
        if let msg = data.decodeWebsocketMessage(Turn.self) {
            let turn = msg.data
            self.currentTurnPlayerID = turn.playerID
        }
    }
    
    private func send(action: GameAction.Action) {
        let gameAction = GameAction(action: action)
        send(data: gameAction)
    }
    
    private func send<T: Codable>(data: T) {
        guard let gameID = gameID else {
            return
        }
        
        let message = ServerMessage(playerID: player.id,
                                    gameID: gameID,
                                    data: data)
        let data = try! JSONEncoder().encode(message)
        send(message: .data(data))
    }
}
