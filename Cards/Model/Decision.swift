//
//  Decision.swift
//  Cards
//
//  Created by Wayne Bishop on 8/2/22.
//

import Foundation

 /*
 we are defining how the selected
 features are composed from within the tree
 */

class Feature <T: Equatable> {
    
    var name: String?
    var leaf: Action?
    var left: Feature<T>?
    var right: Feature<T>?
    
    private var decision: T?
    
        

    //set a comparable type
    func newDecision<T: Equatable>(_ name: String, decision: T) {
        
         /*
         todo: how do we know if a decision should be
         placed on the left or right hand side of the tree?
         Automatic insertion could be based on a basic left-to-right order.
         */
        
        //accept decisions with Bool values since these can also be
        //stored as Int values (e.g. decisions).
    }
    
    
    func newLeaf(_name: String, action: Action) {
        
    }
    
}


class Decision <T: Equatable> {
    
    var root: Feature<T>?

    
    func setTree(with tree: Feature<T>) {
        //this were the completed tree is added to the decision model
    }

    
    func findAnswer(using decision: T) -> Action?  {
        //navigate the tree based on the supplied
        //decision, eventually returning a result.
        return nil
    }
    
    
}


