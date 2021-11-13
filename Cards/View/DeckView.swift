//
//  DeckView.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import SwiftUI

struct DeckView: View {
    @ObservedObject var viewModel: DeckViewViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.deck.cards, id: \.id) { card in
                Text("\(card.suit.name) \(card.score.name)")
            }
            .navigationTitle("Card Deck")
            .navigationBarItems(
                leading:
                    Button("Reset") {
                        viewModel.deck.reset()
                    },
                trailing:
                    Button("Shuffle") {
                        viewModel.deck.shuffle()
                    }
            )
        }
        .tabItem {
            Image(systemName: "rectangle.on.rectangle")
            Text("Deck")
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            DeckView(deck: Deck())
//            DeckView(viewModel: DeckViewViewModel(deck: Deck()))
        }
    }
}
