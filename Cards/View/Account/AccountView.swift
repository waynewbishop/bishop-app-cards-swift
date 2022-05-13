//
//  AccountView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/12/22.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var cardTable: CardTable

    var body: some View {
        VStack {
            HStack(spacing: 71.0) {
                Text("Welcome, " + cardTable.localPlayer.name)
                    .font(.title)
                    .fontWeight(.bold)
                                    
                Button {
                    //some action goes here..
                    
                } label: {
                    GameImage(name: "arrow.uturn.down.circle", width: 45, height: 45, 
                              color: Color.green)
                }
                .buttonStyle(.borderless)

            }
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(cardTable: CardTable())
    }
}
