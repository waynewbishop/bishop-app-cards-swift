//
//  Game.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import Foundation
import Combine

class Game: ObservableObject {
    let id = UUID()
    @Published private(set) var deck: Deck
    @Published private(set) var dealer: Dealer
    @Published private(set) var players: [Player]
    
    init(dealer: Dealer, players: [Player]) {
        self.deck = dealer.deck
        self.dealer = dealer
        self.players = players
    }
    
    private func dealCard(face: Card.Face = .up) {
        //        1. every player gets a card face up
        //        2. every player gets a card face down
        for (index, _) in players.enumerated() {
            if let card = dealer.dealCard() {
                players[index].receive(card)
                players[index].score = score(for: players[index])
            }
        }
    }
    
    func deal() {
        // after all bets
        //        1. every player gets a card face up
        dealCard()
        //        2. every player gets a card face down
        dealCard(face: .down)
        
//        2. dealer get 1 face up
//        3. every player gets a second card face up
//        4. dealer get one face down
    }
    
    func hit(_ player: Player) {
        if let card = dealer.dealCard(),
           let index = players.firstIndex(of: player) {
            players[index].receive(card)
            players[index].score = score(for: players[index])
        }
    }
    
    private func score(_ hand: Hand) -> Int {
        let secondScore = hand.cards.reduce(0, { $0 + $1.secondaryValue })
        
        if secondScore > 21 {
            let score = hand.cards.reduce(0, { $0 + $1.primaryValue })
            
            return min(score, secondScore)
        }
        
        return secondScore
    }
    
    private func score(for player: Player) -> Int {
        score(player.hand)
    }
    
    func stand(_ player: Player) {
        // player stands...
    }
    
    func reset() {
        for (index, _) in players.enumerated() {
            players[index].resetHand()
            players[index].score = score(for: players[index])
        }
    }
}

extension Game: Hashable {
    static func == (lhs: Game, rhs: Game) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
