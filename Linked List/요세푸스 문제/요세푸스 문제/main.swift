//
//  main.swift
//  요세푸스 문제
//
//  Created by 강민수 on 2023/01/08.
//

import Foundation

class Node {
    let value: Int
    var next: Node?
    var prev: Node?
    
    init(value: Int, prev: Node? = nil, next: Node? = nil) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}

struct LinkedList {
    var head: Node?
    var tail: Node?
    
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
    }
    
    mutating func removeFirst() -> Int? {
        defer {
            self.tail?.next = self.head?.next
            self.head = self.head?.next
            self.head?.prev = self.tail
        }
        
        guard let value = self.head?.value else { return nil }
        
        return value
    }
    
    mutating func moveTo(number: Int) {
        for _ in 0..<number {
            self.tail = self.head
            self.head = self.head?.next
        }
    }
}

let inputs = readLine()!.split(separator: " ").map { Int($0)! }
let n = inputs[0]
let k = inputs[1]

var answer: [Int] = []
var result = ""

var josephus = LinkedList(size: n)

for _ in 0..<n {
    josephus.moveTo(number: k-1)
    if let value = josephus.removeFirst() {
        answer.append(value)
    }
}

result = answer.description.replacingOccurrences(of: "[", with: "<")
print(result.replacingOccurrences(of: "]", with: ">"))
