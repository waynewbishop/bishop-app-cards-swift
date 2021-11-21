//
//  PlayerViewViewModel.swift
//  Cards
//
//  Created by Sam Warfield on 11/21/21.
//

import Foundation

class PlayerViewViewModel: ObservableObject {
    @Published private(set) var game: Blackjack
    @Published private(set) var player: Player
    
    var name: String {
        player.name
    }
    
    var cards: [Card] {
        player.hand.cards
    }
    
    var score: String {
        "\(player.score)"
    }
    
    init(game: Blackjack,
         player: Player) {
        self.game = game
        self.player = player
    }
    
    func hit() {
        game.hit(player)
    }
    
    func stand() {
        game.stand(player)
    }
}
