//
//  AccountView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/12/22.
//

import SwiftUI
import GroupActivities

struct AccountView: View {
    
    @ObservedObject var cardTable: CardTable
    @StateObject var groupStateObserver = GroupStateObserver()

    var body: some View {
        VStack {
            HStack(spacing: 50.0) {
                Text("Welcome, " + cardTable.localPlayer.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: 250, alignment: .leading)
                        
                    
                    //check for valid session
                    if cardTable.groupSession == nil && groupStateObserver.isEligibleForGroupSession {
                        
                        Button {
                            cardTable.startSharing()
                            
                        } label: {
                            GameImage(name: "person.2.circle", width: 45, height: 45, color: Color.green)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    else {
                        GameImage(name: "person.2.circle", width: 45, height: 45, color: Color.black)
                    }

            }
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(cardTable: CardTable())
    }
}
