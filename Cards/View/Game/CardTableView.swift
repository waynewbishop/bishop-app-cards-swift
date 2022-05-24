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
        VStack(alignment: .trailing) {
            
            //display dealing button if queued players is less than 2
            Text(cardTable.response)
                .font(.title)
                .frame(minWidth: 200, maxWidth: 350, minHeight: 200, maxHeight: 375)
        }
    }
    
}

struct CardTableView_Previews: PreviewProvider {
    static var previews: some View {
        CardTableView(cardTable: CardTable(), uiMessage: UIMessage())
   }
}
