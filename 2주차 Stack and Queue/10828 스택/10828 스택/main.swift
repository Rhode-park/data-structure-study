//
//  main.swift
//  1021 회전하는 큐
//
//  Created by Jinah Park on 2023/01/08.
//

import Foundation

class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T, next: Node<T>? = nil) {
            self.data = data
            self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(data)"
        }
        return "\(data) -> " + String(describing: next) + " "
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(_ data: T) {
        head = Node(data: data, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ data: T) {
        guard !isEmpty else {
            push(data)
            return
        }
        let node = Node(data: data)
        tail!.next = node
        tail = node
    }
    
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.data
    }
    
    mutating func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        
        previous.next = nil
        tail = previous
        return current.data
    }
    
    init() {}
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

var list = LinkedList<Int>()

let nnm = readLine()!.split(separator: " ")
let n = Int(nnm[0])!
let m = Int(nnm[1])!

let orders = readLine()!.split(separator: " ")

var count = 0

for i in 0..<n {
    list.append(i+1)
}

func stepTwo() {
    let movingComponent = list.removeLast()!
    list.push(movingComponent)
}

func stepThree() {
    let movingComponent = list.pop()!
    list.append(movingComponent)
}

func gamestart() {
    for j in orders {
        if Int(j) == list.head?.data {
            list.pop()
            print(list)
            print(count)
        } else {
            stepTwo()
            count += 1
            gamestart()
            stepThree()
            count -= 1
            print(count)
        }
    }
}

gamestart()

//런타임오류잼
