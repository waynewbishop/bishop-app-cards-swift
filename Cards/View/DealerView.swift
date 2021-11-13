//
//  DealerView.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import SwiftUI

struct DealerView: View {
    var body: some View {
        NavigationView {
            Text("DealerView")
                .navigationTitle("Dealer")
                .navigationBarItems(
                    trailing:
                        Button("Deal") {
                            print("draw from deck")
                        }
                )
        }
        .tabItem {
            Image(systemName: "house")
            Text("Dealer")
        }
    }
}
