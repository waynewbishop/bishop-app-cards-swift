//
//  GameView.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Dealer")) {
                    Text("Show Dealer Cards")
//                    ForEach(viewModel.dealer.hand.sequence) { card in
//                        Text(card.description)
//                    }
                }
                ForEach(viewModel.players) { player in
                    Section {
                        ForEach(player.hand.cards) { card in
                            Text(card.description)
                        }
                    } header: {
                        HStack {
                            Text(player.name)
                            Text("\(player.score)")
                            Spacer()
                            Button("Hit") {
                                viewModel.hit(player)
                            }
                            Button("Stand") {
                                viewModel.stand(player)
                            }
                        }
                    }
                }
            }
            .listStyle(DefaultListStyle())
            .navigationTitle("Game View")
            .navigationBarItems(
                leading:
                    Button(viewModel.resetButtonTitle) {
                        viewModel.resetGame()
                    }
                ,
                trailing:
                    Button(viewModel.buttonTitle) {
                        viewModel.startGame()
                    }
            )
        }
        .tabItem {
            Image(systemName: "person")
            Text("Player")
        }
    }
}
