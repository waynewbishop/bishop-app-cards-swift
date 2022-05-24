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
        
    var body: some View {
        
        HStack (alignment: .bottom, spacing: 30.0) {            
            
            if cardTable.groupSession != nil {
                
                //deal card
                Button  {
                    cardTable.deal()
                } label: {
                    GameImage(name: "play.circle")
                }
                .buttonStyle(.borderless)
                
                
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
                GameImage(name: "play.circle", color: Color.black)
                GameImage(name: "hand.thumbsup.circle", color: Color.black)
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
    }
}


struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        ControlBar(cardTable: CardTable())
            .environment(\.sizeCategory, .large)
    }
}
