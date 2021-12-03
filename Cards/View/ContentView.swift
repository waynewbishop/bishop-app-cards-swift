//
//  ContentView.swift
//  Cards
//
//  Created by Sam Warfield on 11/5/21.
//

import SwiftUI

struct ContentView: View {
    private var viewModel = ContentViewViewModel()
    
    var body: some View {
        TabView {
            GameView(viewModel: viewModel.gameViewViewModel)
//            DeckView(viewModel: viewModel.deckViewViewModel)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//        }
//    }
//}
