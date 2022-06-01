//
//  DebugView.swift
//  Cards
//
//  Created by Wayne Bishop on 5/13/22.
//

import SwiftUI

struct DebugView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            ForEach((1...10).reversed(), id: \.self) {
                Text("\($0)…")
            }

            Text("Ready or not, here I come!")
        }
        
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
