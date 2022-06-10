//
//  historyView.swift
//  Cards
//
//  Created by Wayne Bishop on 6/5/22.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage
    
    var body: some View {
        
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("History")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                    .frame(height: 50)
                
                Text("some list goes here..")
                
            }
            
            Spacer()
        }
        
    }
    
}


struct historyView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(cardTable: CardTable(), uiMessage: UIMessage())
    }
}
