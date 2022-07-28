//
//  Players.swift
//  Cards
//
//  Created by Wayne Bishop on 7/21/22.
//

import Foundation



//players management
class Players: Codable {
    
    var active = Queue<Player>()
    var holding = Queue<Player>()
    var waiting = Queue<Player>()
        
    var dealer = Dealer()
    
    
    func reset() {
        //todo: add all waiting players to active queue?
        //what of the existing active players?
    }
    
    
}
