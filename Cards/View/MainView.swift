//
//  TabView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/11/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage
    
    var body: some View {
        
        TabView {
            ContentView(cardTable: cardTable, uiMessage: uiMessage)
                .tabItem {
                    Label("Game", systemImage: "iphone.homebutton.radiowaves.left.and.right")
                }

            AccountDetailView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
        }
    }
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(cardTable: CardTable(), uiMessage: UIMessage().testSingleUser())
            MainView(cardTable: CardTable(), uiMessage: UIMessage().testMultiUser())
        }
    }
}
