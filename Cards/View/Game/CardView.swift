//
//  CardView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/25/22.
//

import SwiftUI


struct CardView: View {
    
    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage
            
    var body: some View {
                
        List(uiMessage.players.elements) { item in
            HStack {
                
                GameImage(name: "person.circle.fill")
                
                VStack (alignment: .leading) {
                    Text(item.name)
                                    
                    Text(String(item.hand.score) + " points")
                        .font(.subheadline)
                        .foregroundColor(Color.gray) +
                    
                    Text(", " + String(item.hand.count) + " cards")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}


struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CardView(cardTable: CardTable(), uiMessage: UIMessage().testData())
    }
}
