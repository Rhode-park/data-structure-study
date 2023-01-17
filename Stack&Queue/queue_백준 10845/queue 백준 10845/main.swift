//
//  main.swift
//  stack and queue
//
//  Created by jiye Yi on 2023/01/17.
//

struct Queue {
    var storage: [Int] = []

    var isEmpty: Bool {
        return storage.isEmpty
    }

    var size: Int {
        return storage.count
    }

    mutating func push(_ value: Int) {
        storage.append(value)
    }

    mutating func pop() -> Int {
        if isEmpty {
            return -1
        }
        return storage.removeFirst()
    }

    mutating func checkEmpty() -> Int {
        if isEmpty {
            return 1
        } else {
            return 0
        }
    }

    mutating func front() -> Int {
        guard let firstValue = storage.first else {
            return -1
        }
        return firstValue
    }

    mutating func back() -> Int {
        if isEmpty {
            return -1
        }
        return storage.last!
    }

}


let n = Int(readLine()!)!
var queue = Queue()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ element in
        return String(element)
    }
    
    switch input[0] {
    case "push":
        queue.push(Int(input[1])!)
    case "pop":
        print(queue.pop())
    case "size":
        print(queue.size)
    case "empty":
        print(queue.checkEmpty())
    case "front":
        print(queue.front())
    case "back":
        print(queue.back())
    default:
        continue
    }
}
