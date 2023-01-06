import UIKit

//CustomStringConvertible -> print문을 할 때 설명을 보여주기 위해 채택하는 프로토콜(https://developer.apple.com/documentation/swift/customstringconvertible)
// === -> https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#ID90
// defer
// Generic Type(https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(_ value: T) {
        self.head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: T) {
        guard !self.isEmpty else {
            push(value)
            return
        }
        
        let node = Node(value: value)
        self.tail?.next = node
        tail = node
    }
    
    func node(at index: Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = head
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    func insert(_ value: T, after node: Node<T>) {
        node.next = Node(value: value, next: node.next)
    }
    
    mutating func pop() -> T? {
        defer {
            self.head = self.head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
    }
    
    mutating func removeLast() -> T? {
        guard let head = self.head else {
            return nil
        }
        
        guard head.next != nil else {
            return self.pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next

        }
        
        prev.next = nil
        self.tail = prev
        
        return current.value
    }
    
    mutating func remove(after node: Node<T>) -> T? {
        defer {
            if node.next === tail {
                tail = node
            }
            
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    init() { }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = self.head else {
            return "Empty List"
        }
        
        return String(describing: head)
    }
}

class Node<T> {
    var value: T
    var next: Node? // 꼬리가 nil이 되어야한다.
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)

node1.next = node2

print(node1)
