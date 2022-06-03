//
//  InfoView.swift
//  Cards
//
//  Created by Wayne Bishop on 6/2/22.
//

import SwiftUI

struct InfoView: View {
    
    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage

    var body: some View {
                
        HStack(alignment: .top) {
            VStack {
                GameImage(name: "iphone.homebutton.radiowaves.left.and.right.circle.fill", width: 45, height: 45)
            }
            
            VStack {
                Text("Welcome to Cards! Based on the rules of Blackjack, this game is activated when two or more players are connected on the same Facetime call.")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .frame(width: 230)
            }
        }
        //.frame(width: 300, height: 300, alignment: .center)
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(cardTable: CardTable(), uiMessage: UIMessage())
    }
}
