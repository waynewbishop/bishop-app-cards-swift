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
        
    @ObservedObject var gameManager: GameManager
    
    @State private var selectedGame: GameType = .Blackjack
    @State private var buttonLabel: String = "Start Game"
    @State private var isGamePresented = false
    @State private var screenName: String = ""
    @State private var isStartDisabled: Bool = true

    
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
            
                /*
                 ObservableObject will provide you with a binding to any contained property
                 automatically via the $-prefix syntax:
                 */
                
                TextField(
                    "Screen Name",
                    text: $screenName
                )
                .onChange(of: screenName, perform: { newValue in
                    if newValue.count == 0 {
                       isStartDisabled = true
                    }
                    
                    else {
                        if selectedGame == .Blackjack {
                            gameManager.game.rules = BlackJack()
                            gameManager.game.localPlayer.name = newValue
                            isStartDisabled = false
                        }
                    }
                                         
                    print(newValue)
                })
                
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .padding([.bottom, ], 40)
                     
                /*
                 only present starting game options for the person
                 who initiates the game session. whoever starts their
                 app after being invited will receive their session id
                 afterwards
                 */
                
                //update to check active group session.
                if gameManager.groupSession == nil {
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
                    .onChange(of: selectedGame, perform: { newValue in
                        
                        //define protocol
                        if newValue == .Blackjack {
                            if screenName.count > 0 {
                    
                                gameManager.game.setRules(rulebook: BlackJack())
                                gameManager.game.localPlayer.name = screenName
                                isStartDisabled = false
                            }
                        }
                        else if (newValue == .Poker) || (newValue == .Hearts) {
                            isStartDisabled = true
                        }
                            
                    })
                    .pickerStyle(.segmented)
                    .padding([.bottom], 20)
                }
                
            
                Button (buttonLabel)  {
                    if gameManager.groupSession != nil {
                        buttonLabel = "Join Game"
                    }
                    else {
                        buttonLabel = "Start Game"
                        gameManager.startSharing()
                    }
                }
                .disabled(isStartDisabled)

                
                //callback from GroupActivity.activate()
                .task {
                    for await session in Cards.sessions() {
                        gameManager.configureGroupSession(session)
                    }
                }
                
                
                //present as a modal dialog
                .fullScreenCover(isPresented: $isGamePresented) {
                    MainView(gameManager: gameManager)
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
        LobbyView(gameManager: GameManager())
    }
}
