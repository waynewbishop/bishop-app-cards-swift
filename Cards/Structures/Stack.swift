//
//  Stack.swift
//  Cards
//
//  Created by Sam Warfield on 11/5/21.
//

import Foundation

/**
 Stack algorithm. Provides a model
 
 - Complexity: O(1) - constant time average time for all operations.
 */

struct Stack<T> {
    private(set) var elements: [T] = []
    
    var count: Int {
        elements.count
    }
    
    func peek() -> T? {
        elements.last
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        elements.popLast()
    }
    
    mutating func swapAt(lhs: Int, rhs: Int) {
        elements.swapAt(lhs, rhs)
    }
}

extension Stack: Sequence {
    typealias Iterator = IndexingIterator<Array<T>>
    
    func makeIterator() -> Iterator {
        elements.makeIterator()
    }
}

extension Stack: MutableCollection {
    typealias Index = Array<T>.Index
    
    var startIndex: Index {
        elements.startIndex
    }
    
    var endIndex: Index {
        elements.endIndex
    }
    
    func index(after i: Index) -> Index {
        elements.index(after: i)
    }
    
    subscript(position: Index) -> Iterator.Element {
        get {
            elements[position]
        }
        set {
            elements[position] = newValue
        }
    }
}

extension Stack: RandomAccessCollection {
    
}
