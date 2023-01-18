//
//  main.swift
//  BAEKJOON_10845
//
//  Created by kokkilE on 2023/01/12.
//

import Foundation

struct Queue<T> {
    private var array: [T] = []
    
    init() { }
    
    var size: Int {
        return array.count
    }
    var empty: Int {
        if array.isEmpty {
            return 1
        } else {
            return 0
        }
        
    }
    var front: T? {
        if empty == 1 {
            return -1 as? T
        } else {
            return array.first
        }
    }
    var back: T? {
        if empty == 1 {
            return -1 as? T
        } else {
            return array.last
        }
    }
        
    mutating func push(_ data: T) {
        array.append(data)
    }
    
    mutating func pop() -> T? {
        if empty == 1 {
            return -1 as? T
        } else {
            return array.removeFirst()
        }
    }
}


let numberOfCommnand: Int = (readLine()?.split(separator: " ").compactMap { Int($0) }.first)!
var queue = Queue<Int>()

for _ in 0..<numberOfCommnand {
    if let inputCommand = readLine()?.split(separator: " ") {
        
        switch inputCommand[0] {
        case "push":
            queue.push(Int(inputCommand[1])!)
        case "pop":
            print(queue.pop()! )
        case "size":
            print(queue.size)
        case "empty":
            print(queue.empty)
        case "front":
            print(queue.front!)
        case "back":
            print(queue.back!)
        default:
            continue
        }
    }
}
