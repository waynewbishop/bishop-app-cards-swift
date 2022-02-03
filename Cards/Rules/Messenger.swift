//
//  Messenger.swift
//  Cards
//
//  Created by Wayne Bishop on 1/28/22.
//

import Foundation

//defines the type of server messaging system
protocol Messenger {
    
    func send() -> ()
    func startSharing() -> ()
    
    //func start() -> () //this is where we start the service..
}
