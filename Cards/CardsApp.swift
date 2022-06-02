//
//  CardsApp.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import SwiftUI

@main
struct CardsApp: App {
    
    @StateObject var cardTable = CardTable()
    @StateObject var uiMessage = UIMessage()
    
    var body: some Scene {
        WindowGroup {
            MainView(cardTable: cardTable, uiMessage: uiMessage)
        }
    }
    
}

