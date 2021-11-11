//
//  Stack.swift
//  Cards
//
//  Created by Wayne Bishop on 11/10/21.
//

import Foundation


public struct Stack <T> {

   var elements : [T] = [T]()
    
    //number of items
    var count: Int {
        return elements.count
    }

    
    public func peek() -> T? {
          return elements.last
    }
    
    
    public mutating func push(_ element: T) {
          elements.append(element)
    }

    
    public mutating func pop() -> T? {
          return elements.popLast()
    }
        
}
