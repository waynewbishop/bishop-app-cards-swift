//
//  ContentView.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var gameManager: GameManager
    @ObservedObject var uiMessage: UIMessage
    
    
    var body: some View {
        
        //main views
        VStack {
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                        
            HeaderView(gameManager: gameManager)
            CardTableView(gameManager: gameManager, uiMessage: uiMessage)
            ControlBar(gameManager: gameManager, uiMessage: uiMessage)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(gameManager: GameManager().testGameBlackJack(), uiMessage: UIMessage().testMultiUser())
            ContentView(gameManager: GameManager(), uiMessage: UIMessage().testSingleUser())
            ContentView(gameManager: GameManager(), uiMessage: UIMessage())
        }
    }
}
