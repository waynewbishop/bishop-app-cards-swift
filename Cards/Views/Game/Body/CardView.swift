//
//  CardView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/25/22.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var gameManager: GameManager
    @ObservedObject var uiMessage: UIMessage

    
    var body: some View {
        VStack {
            ForEach(uiMessage.players.active.elements) { player in
                CardRow(player: player, game: gameManager.game)
            }
        }
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(gameManager: GameManager(), uiMessage: UIMessage().testMultiUser())
    }
}


struct CardRow: View {
    
    var player: Player
    var game: Game
    var checkColor = Color.gray
        
    var body: some View {
        
        HStack {
            
            GameImage(name: "person.text.rectangle.fill", width: 45.0)
            
            VStack(alignment: .leading) {
                
                Text(player.name)
                                    
                Text(String(player.hand.score) + " points")
                    .font(.subheadline)
                    .foregroundColor(Color.gray) +
                
                Text(", " + String(player.hand.count) + " cards")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
                        
            //indicate the current player
            if player == game.current {
                GameImage(name: "checkmark.circle.fill", width: 20, height: 20, color: Color.green)
            }
            
            else if player.outcome == .winner {
                GameImage(name: "checkmark.seal.fill", width: 20, height: 20, color: Color.yellow)
            }
            
            //todo: run and load other images
            //based on the player.outcome status.
            //fold, hold and bust
                        
            else {
                GameImage(name: "checkmark.circle.fill", width: 20, height: 20, color: Color.gray)
            }
        }
        .padding(.horizontal, 10.0)
    }
}

