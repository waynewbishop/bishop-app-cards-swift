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
        
        HStack (alignment: .bottom, spacing: 35.0) {

            //check for valid session
            if cardTable.groupSession == nil && groupStateObserver.isEligibleForGroupSession {
                
                Button {
                    cardTable.startSharing()
                    
                } label: {
                    GameImage(name: "person.2.circle", color: Color.green)
                }
                .buttonStyle(.borderedProminent)
            }
            else {
                GameImage(name: "person.2.circle", color: Color.black)
            }
            
            
            if cardTable.groupSession != nil {
                
                //hit card
                Button  {
                    cardTable.hit()
                } label: {
                    GameImage(name: "hand.thumbsup.circle")
                }
                .buttonStyle(.borderless)

                
                //hold
                Button  {
                    cardTable.hold()
                } label: {
                    GameImage(name: "hand.raised.circle")
                }
                .buttonStyle(.borderless)
                            

                //fold
                Button  {
                    cardTable.fold()
                } label: {
                    GameImage(name: "xmark.circle")
                }
                .buttonStyle(.borderless)
                
            }
            
            else {
                GameImage(name: "hand.thumbsup.circle", color: Color.black)
                GameImage(name: "hand.raised.circle", color: Color.black)
                GameImage(name: "hand.raised.circle" , color: Color.black)
                GameImage(name: "xmark.circle" , color: Color.black)
            }
            
            
           
            
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
            
    }
}
