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
        
        VStack {
            
            ForEach(uiMessage.players.elements) { player in
                HStack {
                    
                    GameImage(name: "person.text.rectangle.fill", width: 45.0)
                    
                    VStack(alignment: .leading) {
                        Text(player.name)
                                        
                        Text(String(player.hand.score) + " points")
                            .font(.subheadline)
                            .foregroundColor(Color.gray) +
                        
                        Text(", " + String(player.hand.count) + " cards")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                
                    Spacer()
                    
                    //indicate the current player
                    if player == cardTable.current {
                        GameImage(name: "checkmark.circle.fill", width: 20, height: 20, color: Color.green)
                    }
                }
                .padding(.leading, 10.0)
            }
            
        }
       
    }
}


struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CardView(cardTable: CardTable(), uiMessage: UIMessage().testMultiUser())
    }
}
