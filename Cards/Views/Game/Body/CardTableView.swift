//
//  CardTableView.swift
//  Cards
//
//  Created by Wayne Bishop on 2/4/22.
//

import SwiftUI

struct CardTableView: View {
    
    @ObservedObject var gameManager: GameManager
    @ObservedObject var uiMessage: UIMessage

    
    var body: some View {                
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 45)
            
            ScrollView {
                CardView(gameManager: gameManager, uiMessage: uiMessage)
            }
        }
        .frame(width: 300, height: 300)
    }
}


struct CardTableView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardTableView(gameManager: GameManager(), uiMessage: UIMessage().testMultiUser())
            CardTableView(gameManager: GameManager(), uiMessage: UIMessage().testSingleUser())
            CardTableView(gameManager: GameManager(), uiMessage: UIMessage())
        }
   }
}
