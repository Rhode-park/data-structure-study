////
////  main.swift
////  BAEKJOON_2164
////
////  Created by kokkilE on 2023/01/13.
////
//
//struct CardSet {
//    var container = [Int]()
//    var isEmpty: Bool {
//        if container.isEmpty {
//            return true
//        } else {
//            return false
//        }
//    }
//
//    mutating func setCards(_ numberOfCard: Int) {
//        for data in 0..<numberOfCard {
//            container.append(numberOfCard - data)
//        }
//    }
//
//    mutating func getLastCard() -> Int {
//        while container.count > 1 {
//            container.popLast()
//            let lastCard = container.popLast()!
//            container.insert(lastCard, at: 0)
//        }
//
//        return container.removeFirst()
//    }
//}
//
//var cardSet = CardSet()
//let numberOfCard = Int(readLine()!)!
//
//cardSet.setCards(numberOfCard)
//print(cardSet.getLastCard())

//
//  main.swift
//  BAEKJOON_2164
//
//  Created by kokkilE on 2023/01/13.
//

class Node {
    var data: Int
    var next: Node?
    var prev: Node?
    
    init(_ data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct Stack {
    var head: Node?
    var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    var isOnlyOneNode: Bool {
        return head === tail
    }
    
    mutating func stackNode(_ data: Int) {
        head = Node(data, next: head)
        head?.next?.prev = head
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func pop() -> Node? {
        defer {
            head?.next?.prev = nil
            head = head?.next
            
            if isEmpty {
                tail = nil
            }
        }
        
        return head
    }
    
    mutating func moveHeadToTail() {
        let prevHead = self.pop()
        
        tail?.next = prevHead
        prevHead?.prev = tail
        tail = prevHead
    }
}

var cardStack = Stack()
let numberOfCard = Int(readLine()!)!

for data in 0..<numberOfCard {
    cardStack.stackNode(numberOfCard - data)
}

if !cardStack.isOnlyOneNode {
    cardStack.pop()
    
    while !cardStack.isOnlyOneNode {
        cardStack.moveHeadToTail()
        cardStack.pop()
    }
}

print((cardStack.head?.data)!)
