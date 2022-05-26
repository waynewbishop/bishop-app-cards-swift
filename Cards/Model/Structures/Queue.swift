//  Queue.swift
//  Cards
//
//  Created by Wayne Bishop on 11/18/21.
//

import Foundation


/// provides a basic wrapper for array object

class Queue<T: Codable & Identifiable> : Codable {
    
   var elements = Array<T>()
    
    var count: Int {
        return elements.count
    }
    
    //retrieve first element
    var peek: T? {
        self.elements.first
    }
    
    func remove(element: T) -> T? {
        guard let index = elements.firstIndex(where: {$0.id == element.id }) else {
            return nil
        }
       return elements.remove(at: index)
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





