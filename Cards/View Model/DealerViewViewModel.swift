//
//  DealerViewViewModel.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import Foundation
import Combine
import CardDeck

class DealerViewViewModel: ObservableObject {
    private var blackjack: Blackjack
    @Published private(set) var hand: Hand
    
    private var cancellables: Set<AnyCancellable> = []

    var cards: [Card] {
        hand.show()
    }
    
    var score: String {
        "\(hand.score)"
    }
    
    init(blackjack: Blackjack) {
        self.blackjack = blackjack
        self.hand = blackjack.dealerHand
        self.blackjack.$dealerHand.sink { [weak self] hand in
            self?.hand = hand
        }.store(in: &cancellables)
    }
}
