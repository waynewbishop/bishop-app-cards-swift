//
//  TabView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/11/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Game", systemImage: "iphone.homebutton.radiowaves.left.and.right")
                }

            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
