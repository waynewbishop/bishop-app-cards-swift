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
                
        
        VStack {
            GameImage(name: "person.2.circle.fill", width: 90, height: 90)
            
            Text("Welcome to Cards! This game allows you to play Blackjack with two or more friends when connected through Facetime.")
                .font(.body)
                .multilineTextAlignment(.leading)
                .frame(width: 310)
         
            
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
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        LobbyView(cardTable: CardTable(), uiMessage: UIMessage())
    }
}
