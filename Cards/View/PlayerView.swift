//
//  PlayerView.swift
//  Cards
//
//  Created by Sam Warfield on 11/21/21.
//

import SwiftUI

struct PlayerView: View {
    var viewModel: PlayerViewViewModel
    
    var body: some View {
        Section {
            ForEach(viewModel.cards) { card in
                Text(card.description)
            }
        } header: {
            HStack {
                Text(viewModel.name)
                Text(viewModel.score)
                Spacer()
                Button("Hit") {
                    viewModel.hit()
                }
                Button("Stand") {
                    viewModel.stand()
                }
            }
        }
    }
}
