//
//  PlayerViewViewModel.swift
//  Cards
//
//  Created by Sam Warfield on 11/21/21.
//

import Foundation
import Combine
import CardDeck

class PlayerViewViewModel: ObservableObject {
    private var blackjack: Blackjack
    @Published private(set) var hand: Hand
    
    private var cancellables: Set<AnyCancellable> = []

    var name: String {
        blackjack.player.name
    }
    
    var cards: [Card] {
        hand.show()
    }
    
    var score: String {
        "\(hand.score)"
    }
    
    init(blackjack: Blackjack) {
        self.blackjack = blackjack
        self.hand = blackjack.player.hand
        self.blackjack.player.$hand.sink { [weak self] hand in
            self?.hand = hand
        }.store(in: &cancellables)
    }
    
    func bet() {
        blackjack.bet()
    }
    
    func hit() {
        blackjack.hit()
    }
    
    func stand() {
        blackjack.stand()
    }
}
