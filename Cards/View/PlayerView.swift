//
//  PlayerView.swift
//  Cards
//
//  Created by Sam Warfield on 11/21/21.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel: PlayerViewViewModel
    
    var body: some View {
        Section {
            ForEach(viewModel.cards) { card in
                Text(card.description)
            }
        } header: {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(viewModel.name)
                            Text(viewModel.score)
                        }
                        Text(viewModel.playerID)
                            .font(.footnote)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button("Bet") {
                        viewModel.bet()
                    }
                    .disabled(viewModel.isNotAbleToBet)
                    Button("Hit") {
                        viewModel.hit()
                    }
                    .disabled(viewModel.isNotAbleToHit)
                    Button("Stand") {
                        viewModel.stand()
                    }
                }
            }
        }
    }
}
