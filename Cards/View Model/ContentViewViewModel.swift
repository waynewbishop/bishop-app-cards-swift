//
//  ContentViewViewModel.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import Foundation

class ContentViewViewModel {
    private let blackjack = Blackjack(player: Player(name: "Sam"))
        
//    var deckViewViewModel: DeckViewViewModel {
//        DeckViewViewModel(serverClient: serverClient)
//    }
    
    var gameViewViewModel: GameViewViewModel {
        GameViewViewModel(blackjack: blackjack)
    }
}
