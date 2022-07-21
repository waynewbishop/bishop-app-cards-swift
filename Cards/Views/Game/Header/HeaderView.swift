//
//  AccountView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/12/22.
//

import SwiftUI
import GroupActivities
import UIKit
import Foundation


struct HeaderView: View {
    
    @ObservedObject var cardTable: CardTable
    @StateObject var groupStateObserver = GroupStateObserver()
    @State var isSharingControllerPresented: Bool =  false
    
    var body: some View {
        
        VStack {
            HStack (alignment: .center) {
                Text(cardTable.rules!.description)
                    .font(.title)
                    .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                
                Spacer()
                
                 Menu("Options") {
                    
                     //invite players
                     Button {
                         isSharingControllerPresented = true
                     } label: {
                         MenuView(image: "shareplay", label: "Invite Players")
                     }
                     .padding()
                     .sheet(isPresented: $isSharingControllerPresented, content: ShareController.init)
                     
                     //creates a new game..
                     Button(action: {}) {
                         MenuView(image: "play.circle", label: "New Game")
                     }
                    
                     /*
                     //stops game for all players
                     Button(action: {}) {
                         MenuView(image: "stop.circle", label: "Quit")
                     }
                    */
                     
                 }
                 .font(.subheadline)
                                                
            }
                        
            HStack {
                Text(cardTable.response)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                
                Spacer()
            }
        }
        .padding(10.0)
        .frame(width: 300, height: 70)
    }
}


struct MenuView: View {
    
    var image: String
    var label: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(label)
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(cardTable: CardTable())
        }
    }
}

