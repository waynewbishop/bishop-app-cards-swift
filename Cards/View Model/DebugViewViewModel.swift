//
//  DebugViewViewModel.swift
//  Cards
//
//  Created by Sam Warfield on 11/24/21.
//

import Foundation
import Combine

class DebugViewViewModel: ObservableObject {
    @Published private(set) var connectedMessage = "Websocket connected: false"
    @Published private(set) var gameID: String = ""
    @Published private(set) var playerID: String = ""
    @Published private(set) var currentTurnPlayerID: UUID? {
        didSet {
            if let id = currentTurnPlayerID {
                currentTurnPlayerIDMessage = "Turn is for \(id)"
            }
            else {
                currentTurnPlayerIDMessage = "Not sure current player"
            }
        }
    }
    @Published private(set) var currentTurnPlayerIDMessage: String = ""

    private var blackjack: Blackjack
    private var cancellables: Set<AnyCancellable> = []
    
    init(blackjack: Blackjack) {
        self.blackjack = blackjack
        self.playerID = "Player: \(blackjack.player.id)"
        self.blackjack.delegate.$isSocketOpen.sink { [weak self] connected in
            self?.connectedMessage = "Websocket connected: \(connected)"
        }.store(in: &cancellables)
        
        self.blackjack.$gameID.sink { [weak self] gameID in
            self?.gameID = "Game: \(gameID?.uuidString ?? "")"
        }.store(in: &cancellables)
        
        self.blackjack.$currentTurnPlayerID.sink { [weak self] playerID in
            self?.currentTurnPlayerID = playerID
        }.store(in: &cancellables)
    }
}
