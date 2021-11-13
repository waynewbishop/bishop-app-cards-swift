//
//  Deck.swift
//  Cards
//
//  Created by Sam Warfield on 11/5/21.
//

import Foundation

class Deck: ObservableObject {
    @Published private(set) var cards = Stack<Card>()
    
    init() {
        reset()
    }
    
    func reset() {
        cards = Stack<Card>()
        
        let suits = [
            Suit(name: "Hearts"),
            Suit(name: "Diamonds"),
            Suit(name: "Spades"),
            Suit(name: "Clubs")
        ]
        
        for suit in suits {
            for score in suit.scores {
                cards.push(Card(suit: suit, score: score))
            }
        }
    }
    
    func shuffle() {
        let cardRange: Range = 0..<cards.count
        
        for _ in 0...cards.count {
            let first = Int.random(in: cardRange)
            let second = Int.random(in: cardRange)
            
            cards.swapAt(lhs: first, rhs: second)
        }
    }
    
    func draw() -> Card? {
        cards.pop()
    }
}

//extension Deck: Sequence {
//    typealias Iterator = IndexingIterator<Array<Card>>
//    
//    func makeIterator() -> Iterator {
//        cards.makeIterator()
//    }
//}
//
//extension Deck: MutableCollection {
//    typealias Index = Stack<Card>.Index
//    
//    var startIndex: Index {
//        cards.startIndex
//    }
//    
//    var endIndex: Index {
//        cards.endIndex
//    }
//    
//    func index(after i: Index) -> Index {
//        cards.index(after: i)
//    }
//    
//    subscript(position: Index) -> Card {
//        get {
//            cards[position]
//        }
//        set {
//            cards[position] = newValue
//        }
//    }
//}
//
//extension Deck: RandomAccessCollection {
//    
//}
