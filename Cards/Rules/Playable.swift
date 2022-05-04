//
//  Playable.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


@MainActor  //define async rules for conforming types..
protocol Playable {
    
    var players: Queue<Player> { get set }
    var hasStarted: Bool { get set }
    var deck: Deck { get }
    
    func start() ->()
    func nextTurn() -> ()
    
}
