//
//  GameViewViewModel.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import Foundation
import Combine

class GameViewViewModel: ObservableObject {
    @Published private(set) var game: Blackjack
    @Published private(set) var buttonTitle = "New Game"
    @Published private(set) var resetButtonTitle = "Reset"
    private var anyCancellable = Set<AnyCancellable>()
    
    var dealer: Dealer {
        game.dealer
    }
    
    var players: [Player] {
        game.players
    }
    
    init(game: Blackjack) {
        self.game = game
        self.game.objectWillChange.sink {
            self.objectWillChange.send()
        }.store(in: &anyCancellable)
    }
    
    func startGame() {
        buttonTitle = "Hit"
        game.deal()
    }
    
    func resetGame() {
        buttonTitle = "New Game"
        game.reset()
    }
    
    func hit(_ player: Player) {
        game.hit(player)
    }
    
    func stand(_ player: Player) {
        game.stand(player)
    }
}
