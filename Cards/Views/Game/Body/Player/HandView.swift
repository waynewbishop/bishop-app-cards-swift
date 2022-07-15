//
//  HandView.swift
//  Cards
//
//  Created by Wayne Bishop on 7/14/22.
//

import SwiftUI

struct HandView: View {
    
    let colors: [Color] =
        [.red, .orange, .yellow, .green, .blue, .purple]

    var body: some View {
        ZStack {
            ForEach(0..<colors.count) {
                
                //todo: Rectangle will be the custom card
                //object we create from scratch with SwiftUI.
                Rectangle()
                    .fill(colors[$0])
                    .frame(width: 60, height: 100)
                    .offset(x: CGFloat($0) * 30.0,
                            y: 0)
            }
        }
    }
    
}

struct HandView_Previews: PreviewProvider {
    static var previews: some View {
        HandView()
    }
}
