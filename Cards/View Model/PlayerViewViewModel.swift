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
    @Published private(set) var playerID: String
    @Published private(set) var hand: Hand
    @Published private(set) var isNotAbleToBet: Bool
    @Published private(set) var isNotAbleToHit: Bool
    
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
        let hand = blackjack.player.hand
        self.blackjack = blackjack
        self.hand = hand
        self.isNotAbleToBet = hand.count > 0
        self.isNotAbleToHit = hand.score >= 21
        self.playerID = blackjack.player.id.uuidString
        self.blackjack.player.$hand.sink { [weak self] hand in
            self?.hand = hand
            self?.isNotAbleToBet = hand.count > 0
            self?.isNotAbleToHit = hand.score >= 21
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
