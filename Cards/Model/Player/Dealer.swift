//
//  Dealer.swift
//  Cards
//
//  Created by Wayne Bishop on 7/27/22.
//

import Foundation


class Dealer: Player {
    
    
    //invoke the correct decision model, based on Playable instance
    func decisionBlackjack(tMessage: TableMessage) -> TableMessage? {
     
        /*
         the entire tmessage is passed so that we can make a decsiion
         about the curreent state of the players cards as well as the remaining
         cards in the deck. The mutated tMessage is returned to be posted back
         to the groupsession.
         */
        return nil
    }
    

    
    //decision model for poker
    func decisionPoker(tMessage: TableMessage) -> TableMessage?{
        return nil
    }
    
        
}
