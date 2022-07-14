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
                Text(cardTable.game!.description)
                    .font(.title)
                    .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                
                Spacer()
                
                 Menu("Options") {
                     //Button("Invite", action: placeOrder)
                     //todo: rename subview here.. //add parameters..
                     Button(action: {}) {
                         ExtractedView()
                     }
                     .padding()

                     Button("New Game", action: adjustOrder)
                     Button("Quit", action: cancelOrder)
                 }
                 .font(.subheadline)
                                  
                
                /*
                Button ("Invite") {
                    isSharingControllerPresented = true
                }
                .sheet(isPresented: $isSharingControllerPresented, content: ShareController.init)
                .font(.subheadline)
                */
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


struct ExtractedView: View {
    var body: some View {
        HStack {
            Image(systemName: "gift")
            Text("Send")
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

