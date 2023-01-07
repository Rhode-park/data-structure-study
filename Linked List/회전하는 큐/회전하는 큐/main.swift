//
//  main.swift
//  회전하는 큐
//
//  Created by 강민수 on 2023/01/07.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    var prev: Node?
    
    init(value: Int, prev: Node? = nil, next: Node? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}

struct CircleList {
    var head: Node?
    var tail: Node?
    
    var answer = 0
    
    init(size: Int) {
        var currentNode = Node(value: 1)
        self.head = currentNode
        for _ in 1..<size {
            let nextNode = Node(value: currentNode.value + 1)
            currentNode.next = nextNode
            nextNode.prev = currentNode
            currentNode = nextNode
        }
        self.tail = currentNode
        self.tail?.next = self.head
        self.head?.prev = self.tail
    }
    
    mutating func popFirst(){
        self.head = self.head?.next
        self.tail?.next = self.head
        self.head?.prev = self.tail
    }
    
    mutating func moveToRight() {
        self.head = self.head?.prev
        self.tail = self.head?.prev
        
        self.answer += 1
    }
    
    mutating func moveToLeft() {
        self.tail = self.tail?.next
        self.head = self.head?.next
        
        self.answer += 1
    }
    
//    func printAll() {
//        var node = self.head
//
//        while node !== tail {
//            if let node = node {
//                print("\"[\(node.prev?.value)-\(node.value)-\(node.next?.value)] -> ", terminator: "")
//            }
//            node = node?.next
//        }
//        print("[\(node?.prev?.value)-\(node?.value)-\(node?.next?.value)]", terminator: "")
//    }
    
    func checkLeftDistance(value: Int) -> Int {
        var nowNode = self.head
        var count = 0
        while nowNode?.value != value {
            nowNode = nowNode?.next
            count += 1
        }
        
        return count
    }
    
    func checkRightDistance(value: Int) -> Int {
        var nowNode = self.head
        var count = 0
        while nowNode?.value != value {
            nowNode = nowNode?.prev
            count += 1
        }
        
        return count
    }
}

let inputs = readLine()!.split(separator: " ").map { Int($0)! }
let n = inputs[0]
let m = inputs[1]

let values = readLine()!.split(separator: " ").map { Int($0)! }

var queue = CircleList(size: n)

for value in values {
    guard let headVal = queue.head?.value else { break }
    if headVal == value {
        queue.popFirst()
    } else {
        let leftDistance = queue.checkLeftDistance(value: value)
        let rightDistance = queue.checkRightDistance(value: value)
        
        if leftDistance > rightDistance {
            for _ in 0..<rightDistance {
                queue.moveToRight()
            }
        } else {
            for _ in 0..<leftDistance {
                queue.moveToLeft()
            }
        }
        
        queue.popFirst()
    }
}

print(queue.answer)
