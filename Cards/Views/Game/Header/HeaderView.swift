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
                //cardTable.tMessage.game.rawvalue
                Text("Blackjack")
                    .font(.title)
                    .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                
                Spacer()
                
                Button ("Invite") {
                    isSharingControllerPresented = true
                }
                .sheet(isPresented: $isSharingControllerPresented, content: SharePlayView.init)
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



struct SharePlayView: UIViewControllerRepresentable {
    
    var activity = Cards()
    typealias UIViewControllerType = GroupActivitySharingController
    
    func makeUIViewController(context: Context) -> GroupActivitySharingController {
         return try! GroupActivitySharingController(activity)
    }
    
    func updateUIViewController(_ uiViewController: GroupActivitySharingController, context: Context) {
        //what goes here?
    }
}



struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(cardTable: CardTable())
        }
    }
}
