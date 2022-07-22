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
    var dealer: Player?
    var waiting: [Player] = []

    
    var peek: Player? {
        active.peek
    }
 
    
    var count: Int {
        active.count
    }
    
    
    //sets the dealer
    func setDealer(as player: Player) {
        
        guard self.dealer == nil else {
            return
        }
        
        self.dealer = player
    }
    
    
    func reset() {
        //todo: add all waiting players to active queue?
        //what of the existing active players?
    }
    
    
    func addActive(_ player: Player) {
        active.enQueue(player)
    }

    
    func addWaiting(_ player: Player) {
        waiting.append(player)
    }
    
    
    func remove(_ player: Player) -> Player? {
        active.remove(element: player)
    }
}
