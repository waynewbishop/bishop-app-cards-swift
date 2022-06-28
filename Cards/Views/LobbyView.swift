//
//  InfoView.swift
//  Cards
//
//  Created by Wayne Bishop on 6/2/22.
//

import SwiftUI
import GroupActivities
import UIKit
import Foundation


struct LobbyView: View {
    
    
    @ObservedObject var cardTable: CardTable
    @ObservedObject var uiMessage: UIMessage
    
    @StateObject var groupStateObserver = GroupStateObserver()
    
    @State private var screenName: String = ""
    @State private var selectedGame: GameType = .Blackjack
    @State private var buttonLabel: String = "Start Game"
    @State private var isGamePresented = false
    
    

    var body: some View {
                        
        ZStack {
            
            VStack {
                GameImage(name: "suit.spade.fill", width: 50, height: 50)
                
                Text("Welcome to Cards")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(7)
                
                
                Text("Cards allows you to play the game of your choice when connected with friends via Facetime or iMessage.")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                
                
                TextField(
                    "Screen Name",
                    text: $screenName
                )
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding([.bottom, ], 40)
                     
                /*
                 only present starting game options for the person
                 who initiates the game session. whoever starts their
                 app after being invited will receive their session id
                 afterwards
                 */
                
                if groupStateObserver.isEligibleForGroupSession == false {
                    HStack {
                        Text("Choose the game you'd like to play")
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom)
                        
                        Spacer()
                    }
                        
                    Picker("GameSelection", selection: $selectedGame) {
                        Text("Blackjack").tag(GameType.Blackjack)
                        Text("Poker").tag(GameType.Poker)
                        Text("Hearts").tag(GameType.Hearts)
                    }
                    .pickerStyle(.segmented)
                    .padding([.bottom], 20)
                }
                
                    
                //todo: action invokes a cardTableView as a model windoww.
            
                Button (buttonLabel)  {
                    
                    isGamePresented.toggle()
                    
                    if groupStateObserver.isEligibleForGroupSession {
                        buttonLabel = "Join Game"
                    }
                    else {
                        buttonLabel = "Start Game"
                    }
                }
                
                //present as a modal dialog
                .fullScreenCover(isPresented: $isGamePresented) {
                    MainView(cardTable: cardTable, uiMessage: uiMessage)
                }
                
                Spacer()
                    .frame(width: UIScreen.main.bounds.width, height: 90)
            }
            .frame(width: 300)
        }
    }
}



struct LobbyView_Previews: PreviewProvider {
    static var previews: some View {
        LobbyView(cardTable: CardTable(), uiMessage: UIMessage())
    }
}
