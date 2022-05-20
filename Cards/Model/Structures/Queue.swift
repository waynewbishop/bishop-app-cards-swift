//  Queue.swift
//  Cards
//
//  Created by Wayne Bishop on 11/18/21.
//

import Foundation


/// provides a basic wrapper for array object

class Queue<T: Codable> : Codable {
    
   var elements = Array<T>()
    
    var count: Int {
        return elements.count
    }
    
    //retrieve first element
    func peek() -> T? {
        self.elements.first
    }
    
    //add item - back of queue
    func enQueue(_ item: T) {
        self.elements.append(item)
    }
    
    //remove item - front of queue
    func deQueue() -> T? {
        self.elements.removeFirst()
    }
    
}

