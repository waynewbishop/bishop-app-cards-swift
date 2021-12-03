//
//  GameViewViewModel.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import Foundation
import Combine

class GameViewViewModel: ObservableObject {
    @Published private(set) var buttonTitle = "SharePlay Start"
    @Published private(set) var resetButtonTitle = "Reset"
    private var blackjack: Blackjack
    private var sharePlayManager = SharePlayManager()
    private let gameID = UUID()

    var debugViewViewModel: DebugViewViewModel {
        DebugViewViewModel(blackjack: blackjack)
    }
    
    var dealerViewViewModel: DealerViewViewModel {
        DealerViewViewModel(blackjack: blackjack)
    }
    
    var playerViewViewModel: PlayerViewViewModel {
        PlayerViewViewModel(blackjack: blackjack)
    }
    
    init(blackjack: Blackjack) {
        self.blackjack = blackjack
    }
    
    func resetGame() {
        blackjack.reset()
        blackjack.connect()
        blackjack.join(gameID: gameID)
    }
    
    func activate() {
        sharePlayManager.activate()
    }
}
