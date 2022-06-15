//
//  ContentView.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage
    

    var body: some View {
        
        //main views
        VStack {
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width, height: 30)
            
            //check game status
            if uiMessage.status == .waiting && uiMessage.players.count > 0 {
                
                HeaderView(cardTable: cardTable)
                CardTableView(cardTable: cardTable, uiMessage: uiMessage)
                ControlBar(cardTable: cardTable, uiMessage: uiMessage)
                
            }
            
            else {
                InfoView(cardTable: cardTable, uiMessage: uiMessage)
            }
            
        }
        .task {
            //callback from GroupActivity.activate()?
            for await session in Cards.sessions() {
                cardTable.configureGroupSession(session)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //many users
            ContentView(cardTable: CardTable(), uiMessage: UIMessage().testMultiUser())
            
            //single user
            ContentView(cardTable: CardTable(), uiMessage: UIMessage().testSingleUser())
                        
            //no users
            ContentView(cardTable: CardTable(), uiMessage: UIMessage())
                
        }
    }
}
