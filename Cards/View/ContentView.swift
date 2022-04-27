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
         ControBar(game: game)
         Player reference inside the Game
         When button clicked tell the Game what you want.
         Then the game updates the card table.
         Then the card table gets sent to the players
         The ControlBar buttons are disabled by the Game or Table
         */


    var body: some View {
        
        //add the main views
        VStack {
            
            //stores players views and game objects
            CardTableView(cardTable: CardTable())
                        
            //controls payer actions
            ControlBar(player: Player())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
