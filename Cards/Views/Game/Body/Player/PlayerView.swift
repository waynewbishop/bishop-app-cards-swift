//
//  PlayerView.swift
//  Cards
//
//  Created by Wayne Bishop on 7/14/22.
//

import SwiftUI

struct PlayerView: View {
        
    var body: some View {
        
        VStack {
            HStack {
                GameImage(name: "person.crop.circle.fill")
                
                VStack(alignment: .leading) {
                    Text("Sam Warfield")
                        .font(.title3)
                    
                    Text(String(5) + " points, ")
                        .font(.subheadline)
                        .foregroundColor(Color.gray) +
                                        
                    Text(String(17) + " cards.")
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                
                Spacer()
                
                GameImage(name: "checkmark.circle.fill", width: 20, height: 20, color: Color.orange)
            }
            .padding([.leading, .bottom, .trailing], 10.0)
            
            //pass in the players hand to be presented..
            HandView()


        }
    }
    
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
