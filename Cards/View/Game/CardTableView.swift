//
//  CardTableView.swift
//  Cards
//
//  Created by Wayne Bishop on 2/4/22.
//

import SwiftUI

struct CardTableView: View {
    @ObservedObject var cardTable: CardTable
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(cardTable.response)
                .font(.title)
                .frame(minWidth: 200, maxWidth: 350, minHeight: 200, maxHeight: 350)
        }
    }
    
}

struct CardTableView_Previews: PreviewProvider {
    static var previews: some View {
        CardTableView(cardTable: CardTable())
   }
}
