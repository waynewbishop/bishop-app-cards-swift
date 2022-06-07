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
    
    let frameSize: CGFloat = 50.0
    
    var body: some View {
        VStack() {
            
            Text(cardTable.response)
                .font(.headline)
                .foregroundColor(Color.blue)
                .frame(minWidth: frameSize, maxWidth: 450, minHeight: frameSize, maxHeight: frameSize)
            
            Spacer()
                .frame(height: 20)
            
            ScrollView {
                CardView(cardTable: cardTable, uiMessage: uiMessage)
            }
            
        }
        .frame(width: 300, height: 300, alignment: .center)
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
