//
//  ContentView.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    
    //todo: refactor to observed object?
    var player = Player()
    
    var body: some View {
        
        //insert CardTableView subview..
        //it's this view that is replicated
        //with other players using the group API.
        VStack {
            
            CardTableView(cardTable: player.server!.game.cardTable) // pass in card table
            
//            Control bar
            Button {
                player.newGame()
            } label: {
                Image(systemName: "person.2.fill")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
