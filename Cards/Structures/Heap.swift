//
//  Heap.swift
//  Cards
//
//  Created by Sam Warfield on 11/6/21.
//

import Foundation

/**
 A generic heap algorithm. This class can be defined as a min or max heap.
 */

struct Heap<T: Comparable> {
    enum HeapType {
        case min
        case max
    }
    
    private var items: [T] = []
    private var heapType: HeapType
    
    init(type: HeapType = .min) {
        heapType = type
    }
    
    var sequence: [T] {
        items
    }
    
    var count: Int {
        items.count
    }
    
    func peek() -> T? {
        items.first
    }
    
    mutating func remove(at index: Int) -> T {
        items.remove(at: index)
    }
    
    mutating func enQueue(_ key: T) {
        items.append(key)
        
        var childIndex: Float = Float(items.count) - 1
        var parentIndex: Int = 0
        
        if childIndex != 0 {
            parentIndex = Int(floorf((childIndex - 1) / 2))
        }
        
        while childIndex != 0 {
            let childToUse = items[Int(childIndex)]
            let parentToUse = items[parentIndex]
            
            switch heapType {
            case .min:
                if childToUse <= parentToUse {
                    items.swapAt(parentIndex, Int(childIndex))
                }
                else {
                    break
                }
            case .max:
                if childToUse >= parentToUse {
                    items.swapAt(parentIndex, Int(childIndex))
                }
                else {
                    break
                }
            }
            
            childIndex = Float(parentIndex)
            
            if childIndex != 0 {
                parentIndex = Int(floorf((childIndex - 1) / 2))
            }
        }
    }
}
