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
            
            CardView(cardTable: cardTable, uiMessage: UIMessage().testData())
            
        }
        .frame(width: 350, height: 400, alignment: .center)
    }
    
}

struct CardTableView_Previews: PreviewProvider {
    static var previews: some View {
        CardTableView(cardTable: CardTable(), uiMessage: UIMessage())
   }
}
