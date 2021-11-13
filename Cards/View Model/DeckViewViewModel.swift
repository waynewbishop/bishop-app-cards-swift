//
//  DeckViewViewModel.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import Foundation
import Combine

class DeckViewViewModel: ObservableObject {
    @Published private(set) var deck: Deck
    private var anyCancellable = Set<AnyCancellable>()

    init(deck: Deck) {
        self.deck = deck
        self.deck.objectWillChange.sink {
            self.objectWillChange.send()
        }.store(in: &anyCancellable)
    }
}
