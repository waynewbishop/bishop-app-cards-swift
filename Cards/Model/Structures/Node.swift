//
//  Node.swift
//
//
//  Created by Wayne Bishop on 6/27/20.
//

import Foundation

/**
   A generic recursive data structure used in the creation of `Stack` and `Queue`
   algorithms.

 - Complexity: O(n) - none
 */

public class Node <T> {
    
  var tvalue: T?
  var next: Node<T>?

    public init() {
        //playground support
    }

}
