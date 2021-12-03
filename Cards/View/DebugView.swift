//
//  DebugView.swift
//  Cards
//
//  Created by Sam Warfield on 11/24/21.
//

import SwiftUI

struct DebugView: View {
    @ObservedObject var viewModel: DebugViewViewModel
    
    var body: some View {
        Section {
            Text(viewModel.connectedMessage)
            Text(viewModel.gameID)
                .font(.footnote)
            Text(viewModel.playerID)
                .font(.footnote)
            Text(viewModel.currentTurnPlayerIDMessage)
                .font(.footnote)
        } header: {
            Text("Debug")
        }
    }
}
