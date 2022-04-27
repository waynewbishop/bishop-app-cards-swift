//
//  ControlBar.swift
//  Cards
//
//  Created by Wayne Bishop on 2/4/22.
//

import SwiftUI

struct ControlBar: View {

    //todo: does player need to be an observable object?
    var player: Player
    
    var body: some View {
        
        HStack (alignment: .bottom) {

            //start game
            Button  {
                player.newGame()
            } label: {
                Image(systemName: "person.wave.2")
            }
            .buttonStyle(.borderedProminent)
            
            
            //hit card
            Button  {
                player.newGame()
            } label: {
                Image(systemName: "plus.square.on.square")
            }
            .buttonStyle(.borderedProminent)
            

            //hold
            Button  {
                player.newGame()
            } label: {
                Image(systemName: "hand.raised")
            }
            .buttonStyle(.borderedProminent)
            
            
            //fold - disconnect from game..
            Button  {
                player.newGame()
            } label: {
                Image(systemName: "person.badge.minus")
            }
            .buttonStyle(.borderedProminent)
        }
                
    }
}

struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        ControlBar(player: Player())
            .previewLayout(.sizeThatFits)
    }
}
