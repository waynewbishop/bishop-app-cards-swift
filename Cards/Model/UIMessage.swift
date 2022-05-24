//
//  UIMessage.swift
//  Cards
//
//  Created by Wayne Bishop on 5/20/22.
//

import Foundation


//UI Level presentation

class UIMessage: ObservableObject {

  @Published var players = Queue<Player>()
  @Published var discard = Array<Card>()
  @Published var deck = Deck()
  @Published var holding = Stack<Player>()
  @Published var action = Action.start
  @Published var status = Status.waiting
    
    //update the presentation layer
    func handle(message: TableMessage, from: UUID?) {
        
        //todo: check ableMessage action and each players score.
        //todo: check to see how many active players remain in the queue
        //todo: if the queue is zero, check the holding list to determine the winner..
        //todo: use context.participant to determine who initiated the previous action.
        //todo: if the queue isn't empty, let players know who's turn it is next.
        
        players = message.players
        discard = message.discard
        deck = message.deck
        action = message.action
        holding = message.holding
        action = message.action
        status = message.status
        
    }
    
}
