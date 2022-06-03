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
        ZStack {
            
            VStack {
                
                //stores account view and start button
                AccountView(cardTable: cardTable)
                
                Spacer()
                    .frame(width: UIScreen.main.bounds.width, height: 30)
                
                //load card table based on game status
                if uiMessage.game == .waiting && uiMessage.players.count > 1 {
                    
                    //todo: add a big spacer here..
                    
                    //stores players views and game objects
                    CardTableView(cardTable: cardTable, uiMessage: uiMessage)
                }
                else {
                    InfoView(cardTable: cardTable, uiMessage: uiMessage)
                }
                
                
                //controls player actions
                ControlBar(cardTable: cardTable, uiMessage: uiMessage)
                
            }
            .task {
                //callback from GroupActivity.activate()?
                for await session in Cards.sessions() {
                    cardTable.configureGroupSession(session)
                }
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
