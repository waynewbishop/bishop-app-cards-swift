//
//  InfoView.swift
//  Cards
//
//  Created by Wayne Bishop on 6/2/22.
//

import SwiftUI
import GroupActivities

struct InfoView: View {
    
    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage
    @StateObject var groupStateObserver = GroupStateObserver()

    var body: some View {
                
        VStack {
            HStack(alignment: .top) {
                VStack {
                    GameImage(name: "person.icloud.fill", width: 55, height: 38)
                }
                
                VStack {
                    Text("Welcome to Cards! This game allows you to play Blackjack with two or more friends when connected through Facetime.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .frame(width: 255)
                }
            }
            
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width, height: 30)
                
            //check for valid session
            if cardTable.groupSession == nil && groupStateObserver.isEligibleForGroupSession {
                
                //todo: check for a localuser.name. If empty, present the settings infosheet for them
                //to complete.
                
                Button(role: .none, action: cardTable.startSharing) {
                    Text("Shart Sharing")
                        .font(.body)
                }
            }

        }
        
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(cardTable: CardTable(), uiMessage: UIMessage())
    }
}
