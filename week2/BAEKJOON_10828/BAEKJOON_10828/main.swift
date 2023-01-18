//
//  main.swift
//  BAEKJOON_10828
//
//  Created by kokkilE on 2023/01/12.
//

import Foundation

struct Stack<T> {
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
    var top: T? {
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
            return array.popLast()
        }
    }
}


let numberOfCommnand: Int = (readLine()?.split(separator: " ").compactMap { Int($0) }.first)!
var stack = Stack<Int>()

for _ in 0..<numberOfCommnand {
    if let inputCommand = readLine()?.split(separator: " ") {
        
        switch inputCommand[0] {
        case "push":
            stack.push(Int(inputCommand[1])!)
        case "pop":
            print(stack.pop()! )
        case "size":
            print(stack.size)
        case "empty":
            print(stack.empty)
        case "top":
            print(stack.top!)
        default:
            continue
        }
    }
}
