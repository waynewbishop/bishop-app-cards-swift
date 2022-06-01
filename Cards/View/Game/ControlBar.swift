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
    @ObservedObject var uiMessage: UIMessage

    
    var body: some View {
        HStack (alignment: .bottom, spacing: 30.0) {
            
            if uiMessage.game == .waiting && uiMessage.players.count > 1 {
                Button  {
                    cardTable.deal()
                } label: {
                    GameImage(name: "play.circle")
                }
            }

            
            if cardTable.groupSession != nil && uiMessage.game == .active {
                if cardTable.isMyTurn == true {
                        
                    Button  {
                        cardTable.hit()
                    } label: {
                        GameImage(name: "hand.thumbsup.circle")
                    }

                    
                    Button  {
                        cardTable.hold()
                    } label: {
                        GameImage(name: "hand.raised.circle")
                    }
                    
                    Button  {
                        cardTable.fold()
                    } label: {
                        GameImage(name: "xmark.circle")
                    }
                }
            }
            
            else {
                GameImage(name: "play.circle", color: Color.black)
                GameImage(name: "hand.thumbsup.circle", color: Color.black)
                GameImage(name: "hand.raised.circle" , color: Color.black)
                GameImage(name: "xmark.circle" , color: Color.black)
            }
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
            .symbolRenderingMode(.hierarchical)
            .opacity(100)
    }
}


struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        ControlBar(cardTable: CardTable(), uiMessage: UIMessage())
            .environment(\.sizeCategory, .large)
    }
}
