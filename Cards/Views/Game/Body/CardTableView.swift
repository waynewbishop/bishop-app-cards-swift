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
                
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 45)
            
            ScrollView {
                CardView(cardTable: cardTable, uiMessage: uiMessage)
            }
            
        }
        .frame(width: 300, height: 300)
    }
}

struct CardTableView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardTableView(cardTable: CardTable(), uiMessage: UIMessage().testMultiUser())
            CardTableView(cardTable: CardTable(), uiMessage: UIMessage().testSingleUser())
            CardTableView(cardTable: CardTable(), uiMessage: UIMessage())
        }
        
   }
}
