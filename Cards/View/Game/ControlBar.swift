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
        
        HStack (alignment: .bottom, spacing: 50.0) {

            //start shared game
            if cardTable.groupSession == nil && groupStateObserver.isEligibleForGroupSession {
                Button {
                    
                    cardTable.startSharing()
                    
                } label: {
                    GameImage(name: "person.2.circle")
                }
                .buttonStyle(.borderedProminent)
            }
            else {
                //present some dialog
            }
            
            //hit card
            Button  {
                cardTable.status = "hit button pressed.."
            } label: {
                GameImage(name: "hand.thumbsup.circle")
            }
            .buttonStyle(.borderless)

            
            //hold
            Button  {
                //todo: some action goes here..
                cardTable.status = "hold button pressed.."
            } label: {
                GameImage(name: "hand.raised.circle")
            }
            .buttonStyle(.borderless)
            

            //fold - disconnect from game..
            Button  {
                
                /*
                 todo: what happens when we disconnect from the game?
                 do we want to bother with spectator mode or
                 perform a more simple operation?
                 */
                
                cardTable.status = "disconnect button pressed.."
            } label: {
                GameImage(name: "xmark.circle")
            }
            .buttonStyle(.borderless)
            
            //todo: there also needs to be a reset / new game
            ///button added to the control bar.
        }
        
                
    }
}


//custom image definition
struct GameImage: View {
    
    var name: String
    var width: CGFloat = 35.0
    var height: CGFloat = 35.0
    var color: Color = Color.blue
    
    var body: some View {
        Image(systemName: name)
            .resizable()
            .foregroundColor(color)
            .frame(width: width, height: height)
            .accessibilityLabel("Testing..")
    }
}


struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        ControlBar(cardTable: CardTable())
            .environment(\.sizeCategory, .large)
            .previewLayout(.sizeThatFits)
    }
}
