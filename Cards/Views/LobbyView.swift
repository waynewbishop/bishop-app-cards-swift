//
//  InfoView.swift
//  Cards
//
//  Created by Wayne Bishop on 6/2/22.
//

import SwiftUI
import GroupActivities


struct LobbyView: View {
    
    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage
    @StateObject var groupStateObserver = GroupStateObserver()

    var body: some View {
                
        
        ZStack {
            VStack {
                GameImage(name: "suit.spade.fill", width: 50, height: 50)
                
                Text("Welcome to Cards")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(7)
                
                Text("Cards allows you to play the game of your choice when connected with friends via Facetime or iMessage. Choose the game you'd like to play.")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .frame(width: 300)
             
                
                if cardTable.groupSession == nil && groupStateObserver.isEligibleForGroupSession {
                    
                    //todo: check for a localuser.name. If empty, present the settings infosheet for them
                    //to complete.
                    
                    Button(role: .none, action: cardTable.startSharing) {
                        Text("Start")
                            .font(.body)
                    }
                }
                
                Spacer()
                    .frame(width: UIScreen.main.bounds.width, height: 90)
            }
            .frame(width: 300)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        LobbyView(cardTable: CardTable(), uiMessage: UIMessage())
    }
}
