//
//  CardsApp.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import SwiftUI

@main
struct CardsApp: App {
    
    @StateObject var gameManager = GameManager()
    
    
    var body: some Scene {
        WindowGroup {
            LobbyView(gameManager: gameManager)
        }
    }
    
}

