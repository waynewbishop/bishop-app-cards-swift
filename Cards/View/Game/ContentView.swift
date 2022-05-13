//
//  ContentView.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    
        //1. create CardTable() instance
        //2. create Game() instance with reference to CardTable
        
        /*
         ControlBar(game: game)
         Player reference inside the Game
         When button clicked tell the Game what you want.
         Then the game updates the card table.
         Then the card table gets sent to the players
         The ControlBar buttons are disabled by the Game or Table
         */
    @ObservedObject var cardTable = CardTable()

    var body: some View {
        
        //add the main views
        VStack {
            
            //stores account view and start button
            AccountView(cardTable: cardTable)
            
            //todo: the cardTableView should only
            //apppear if they are on an active Facetime call.
            //otherwise we should display some type of
            //getting started view/dialog.
            
            //stores players views and game objects
            CardTableView(cardTable: cardTable)
                        
            //controls payer actions
            ControlBar(cardTable: cardTable)
            
        }
        .task {
            //is this a callback from the GroupActivity.activate()?
            for await session in Cards.sessions() {
                cardTable.configureGroupSession(session)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
