//
//  CardTableView.swift
//  Cards
//
//  Created by Wayne Bishop on 2/4/22.
//

import SwiftUI

struct CardTableView: View {
    
    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage

    
    var body: some View {
        VStack() {
            
            Text(cardTable.response)
                .font(.subheadline)
                .frame(minWidth: 50, maxWidth: 450, minHeight: 50, maxHeight: 50)
            
            Spacer()
                .frame(height: 50)
            
            ScrollView {
                CardView(cardTable: cardTable, uiMessage: uiMessage)
            }
            
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
    
}

struct CardTableView_Previews: PreviewProvider {
    static var previews: some View {
        CardTableView(cardTable: CardTable(), uiMessage: UIMessage())
   }
}
