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
    
    var players = Array<Player>()
    
    
    var body: some View {
        List(players) { item in
            HStack {
                GameImage(name: "person.circle.fill")
                VStack (alignment: .leading) {
                    Text(item.name)
                    Text(String(item.hand.count) + " cards")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}


struct CardView_Previews: PreviewProvider {
    
    //passing in a
    static var previews: some View {
        CardView(cardTable: CardTable(), uiMessage: UIMessage(), players: UIMessage().players.testData())
    }
}
