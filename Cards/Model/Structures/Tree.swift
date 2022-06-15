//
//  pTree.swift
//  Cards
//
//  Created by Wayne Bishop on 6/13/22.
//

import Foundation


class Tree <T: Player> {
    
    var tvalue: T?
    var next: Tree<T>?
    var right: Tree<T>?
    
    public init() {
        //playground support
    }
}

