//
//  TabView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/11/22.
//

import SwiftUI

struct MainView: View {

    
    @ObservedObject var gameManager: GameManager
    
    /*
     note: even though the GameManager observes changes in the UIMessage, the message
     object runs as it's own indepentant object. GameManager only helps to faciliate
     changes in UIMessage state.
     */
    
    @StateObject var uiMessage = UIMessage()

    
    var body: some View {
        
        TabView {
             ContentView(gameManager: gameManager, uiMessage: uiMessage)
                .tabItem {
                    Label("Game", systemImage: "iphone.homebutton.radiowaves.left.and.right")
                }
            
            ScoreView(gameManager: gameManager, uiMessage: uiMessage)
                .tabItem {
                    Label("Score", systemImage: "number.circle")
                }
        }
    }
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(gameManager: GameManager(), uiMessage: UIMessage())
        }
    }
}
