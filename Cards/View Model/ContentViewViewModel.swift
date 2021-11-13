//
//  ContentViewViewModel.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import Foundation

class ContentViewViewModel {
    private var server = Server()
    
    private(set) var game: Game
    
    init() {
        self.game = Game(dealer: Dealer(deck: Deck()), players: [Player(name: "Sam")])
    }
    
    var deckViewViewModel: DeckViewViewModel {
        DeckViewViewModel(deck: game.deck)
    }
    
    var gameViewViewModel: GameViewViewModel {
        GameViewViewModel(game: game)
    }
    
    var dealerViewViewModel: DealerViewViewModel {
        DealerViewViewModel()
    }
}
