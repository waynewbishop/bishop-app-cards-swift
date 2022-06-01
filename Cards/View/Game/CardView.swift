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
            
            ForEach(uiMessage.players.elements) { item in
                HStack {
                    
                    GameImage(name: "person.text.rectangle.fill", width: 45.0)
                    
                    VStack(alignment: .leading) {
                        Text(item.name)
                                        
                        Text(String(item.hand.score) + " points")
                            .font(.subheadline)
                            .foregroundColor(Color.gray) +
                        
                        Text(", " + String(item.hand.count) + " cards")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                    }
                
                    Spacer()
                    
                    //todo: change the indicator depending on who's turn it is.
                    GameImage(name: "checkmark.circle.fill", width: 20, height: 20, color: Color.green)
                }
            }
            
            /*
            Spacer()
                .frame(height: 30.0)
            
            //todo? move the cardtable.response here?
            Text("this is a test..")
                .font(.subheadline)
             */
        }
       
    }
}


struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CardView(cardTable: CardTable(), uiMessage: UIMessage().testData())
    }
}
