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
                cardTable.response = "hit button pressed.."
            } label: {
                GameImage(name: "hand.thumbsup.circle")
            }
            .buttonStyle(.borderless)

            
            //hold
            Button  {
                //todo: some action goes here..
                cardTable.response = "hold button pressed.."
            } label: {
                GameImage(name: "hand.raised.circle")
            }
            .buttonStyle(.borderless)
            

            //fold - disconnect from game..
            Button  {
                cardTable.response = "disconnect button pressed.."
            } label: {
                GameImage(name: "xmark.circle")
            }
            .buttonStyle(.borderless)
        }
        
                
    }
}


//custom image definition
struct GameImage: View {
    
    var name: String
    var width: CGFloat = 35.0
    var height: CGFloat = 35.0
    
    var body: some View {
        Image(systemName: name)
            .resizable()
            .foregroundColor(Color.blue)
            .frame(width: width, height: height)
    }
}


struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        ControlBar(cardTable: CardTable())
            .environment(\.sizeCategory, .large)
            .previewLayout(.sizeThatFits)
    }
}
