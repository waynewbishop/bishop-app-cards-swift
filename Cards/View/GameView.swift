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
                DebugView(viewModel: viewModel.debugViewViewModel)
                DealerView(viewModel: viewModel.dealerViewViewModel)
                PlayerView(viewModel: viewModel.playerViewViewModel)
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
                        viewModel.activate()
                    }
            )
        }
        .tabItem {
            Image(systemName: "person")
            Text("Player")
        }
    }
}
