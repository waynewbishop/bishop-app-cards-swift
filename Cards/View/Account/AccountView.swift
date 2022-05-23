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
                    .frame(maxWidth: 350, alignment: .leading)
                        
                //check for actiive session
                if cardTable.groupSession != nil {
                    
                    Button {
                        cardTable.deal()
                    } label: {
                        
                        GameImage(name: "play.circle", width: 45, height: 45,
                                  color: Color.green)
                    }
                    .buttonStyle(.borderless)
                    
                }//end if


            }
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(cardTable: CardTable())
    }
}
