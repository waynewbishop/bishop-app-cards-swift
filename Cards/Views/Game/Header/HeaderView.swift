//
//  AccountView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/12/22.
//

import SwiftUI
import GroupActivities

struct HeaderView: View {
    
    @ObservedObject var cardTable: CardTable

    var body: some View {
        
        VStack {
            HStack {
                Text("Cards")
                    .font(.title)
                    .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                Spacer()                
            }
            
            HStack {
                Text(cardTable.response)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                Spacer()
            }
        }
        .padding(.leading, 10.0)
        .frame(width: 300, height: 70)
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(cardTable: CardTable())
        }
    }
}
