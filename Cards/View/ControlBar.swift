//
//  ControlBar.swift
//  Cards
//
//  Created by Wayne Bishop on 2/4/22.
//

import SwiftUI
import GroupActivities


struct ControlBar: View {
    
    @ObservedObject var cardTable: CardTable
    @StateObject var groupStateObserver = GroupStateObserver()
    
    
    var body: some View {
        
        HStack (alignment: .bottom) {

            //start shared game
            if cardTable.groupSession == nil && groupStateObserver.isEligibleForGroupSession {
                Button {
                    
                    cardTable.startSharing()
                    
                } label: {
                    Image(systemName: "person.wave.2")
                }
                .buttonStyle(.borderedProminent)
            }
            else {
                //present some dialog
            }
            
            //hit card
            Button  {
                cardTable.response = "hit button pressed.."
            } label: {
                Image(systemName: "plus.square.on.square")
            }
            .buttonStyle(.borderedProminent)
            

            //hold
            Button  {
                //todo: some action goes here..
                cardTable.response = "hold button pressed.."
            } label: {
                Image(systemName: "hand.raised")
            }
            .buttonStyle(.borderedProminent)
            
            
            //fold - disconnect from game..
            Button  {
                cardTable.response = "disconnect button pressed.."
            } label: {
                Image(systemName: "person.badge.minus")
            }
            .buttonStyle(.borderedProminent)
        }
                
    }
}


struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        ControlBar(cardTable: CardTable())
            .previewLayout(.sizeThatFits)
    }
}
