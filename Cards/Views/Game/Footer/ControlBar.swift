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
    @State private var dealState: Bool = false
    
    var body: some View {
        
        HStack (alignment: .bottom, spacing: 40.0) {
                        
            if uiMessage.status == .waiting && uiMessage.players.count > 1 {
                Button  {
                    dealState.toggle()
                    cardTable.deal()
                } label: {
                    GameImage(name: "play.circle", color: Color.green, label: "Deal")
                }
            }
            else {
                GameImage(name: "play.circle", color: Color.gray, label: "Deal")
            }
            
            
            if uiMessage.status == .active && uiMessage.players.count > 1 {
                if cardTable.isMyTurn == true {
                    
                    Button  {
                        cardTable.deal()
                    } label: {
                        GameImage(name: "play.circle", color: Color.gray, label: "Deal")
                    }
                        
                    Button  {
                        cardTable.hit()
                    } label: {
                        GameImage(name: "hand.thumbsup.circle", color: Color.green, label: "Hit")
                    }
                    
                    Button  {
                        cardTable.hold()
                    } label: {
                        GameImage(name: "hand.raised.circle", color: Color.green, label: "Hold")
                    }
                }
            }
            else {
                GameImage(name: "hand.thumbsup.circle", color: Color.gray, label: "Hit")
                GameImage(name: "hand.raised.circle" , color: Color.gray, label: "Hold")
                GameImage(name: "xmark.circle" , color: Color.gray, label: "Fold")
            }
            
            if uiMessage.status == .active {
                Button  {
                    cardTable.fold()
                    //todo: is this the reset function to disconnect from the
                    //game? 
                } label: {
                    GameImage(name: "xmark.circle", color: Color.green, label: "Fold")
                }
            }
            
                                    
        }
        .frame(width: 300, height: 70)
    }
}

 
//custom image definition
struct GameImage: View {
    
    var name: String
    var width: CGFloat = 35.0
    var height: CGFloat = 35.0
    var color: Color = Color.blue
    var label: String = ""
    
    var body: some View {
        
        VStack {
            Image(systemName: name)
                .resizable()
                .foregroundColor(color)
                .frame(width: width, height: height)
                .symbolRenderingMode(.hierarchical)
            
            Text(label)
                .font(.footnote)
                .foregroundColor(Color.gray)
        }
        
    }
}


struct ControlBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            //multiple users
            ControlBar(cardTable: CardTable(), uiMessage: UIMessage().testMultiUser())
                .environment(\.sizeCategory, .large)
            
            //a single user
            ControlBar(cardTable: CardTable(), uiMessage: UIMessage().testSingleUser())
                .environment(\.sizeCategory, .large)
            
            //no users - intial game launch
            ControlBar(cardTable: CardTable(), uiMessage: UIMessage())
                .environment(\.sizeCategory, .large)
        }
    }
}
