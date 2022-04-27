//
//  Stack.swift
//  Cards
//
//  Created by Wayne Bishop on 4/27/22.
//

import Foundation

public struct Stack <T> {

    var elements : [T] = [T]()

    
    public init() {
        //playground support
    }
    
   //the number of items
    var count: Int {
        return elements.count
    }
    
  
    public mutating func push(_ element: T) {
          elements.append(element)
    }
    

    public mutating func pop() -> T? {
          return elements.popLast()
    }
    

    public func peek() -> T? {
          return elements.last
    }
    
}
