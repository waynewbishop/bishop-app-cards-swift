//
//  DealerView.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import SwiftUI

struct DealerView: View {
    @ObservedObject var viewModel: DealerViewViewModel

    var body: some View {
        Section {
            ForEach(viewModel.cards) { card in
                Text(card.description)
            }
        } header: {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Dealer")
                        Text(viewModel.score)
                    }
                }
                Spacer()
            }
        }
    }
}
