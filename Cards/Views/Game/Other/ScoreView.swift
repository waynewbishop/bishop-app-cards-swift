//
//  historyView.swift
//  Cards
//
//  Created by Wayne Bishop on 6/5/22.
//

import SwiftUI

struct ScoreView: View {
    
    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            //todo: show different content here
            //depending weather or not a game has been started.
            
            VStack(alignment: .leading) {
                Text("Score")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                    .frame(height: 50)
                
                Text("some list goes here..")
            }
            
            Spacer()
            
            Menu("Options") {
                Button("Order Now", action: placeOrder)
                Button("Adjust Order", action: adjustOrder)
                Button("Cancel", action: cancelOrder)
            }
            
        }
        
    }
}

func placeOrder() {}
func adjustOrder() {}
func cancelOrder() {}


struct historyView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(cardTable: CardTable(), uiMessage: UIMessage())
    }
}
