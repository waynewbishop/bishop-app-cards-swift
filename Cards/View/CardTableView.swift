//
//  CardTableView.swift
//  Cards
//
//  Created by Wayne Bishop on 2/4/22.
//

import SwiftUI

struct CardTableView: View {
    @StateObject var cardTable: CardTable
    var response: String = "Hello World!"
    
    
    var body: some View {
        Text(response)
            .frame(minWidth: 200, maxWidth: 450, minHeight: 200, maxHeight: 450)
    }
    
}

struct CardTableView_Previews: PreviewProvider {
    static var previews: some View {
        CardTableView(cardTable: CardTable())
   }
}
