//
//  historyView.swift
//  Cards
//
//  Created by Wayne Bishop on 6/5/22.
//

import SwiftUI

struct ScoreView: View {
    
    @ObservedObject var gameManager: GameManager
    @ObservedObject var uiMessage: UIMessage

    
    var body: some View {
        Text("some text goes here..")
    }
}



struct historyView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(gameManager: GameManager(), uiMessage: UIMessage())
    }
}
