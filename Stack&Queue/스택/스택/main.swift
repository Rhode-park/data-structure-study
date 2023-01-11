//
//  main.swift
//  스택
//
//  Created by 강민수 on 2023/01/12.
//

import Foundation

struct Stack {
    private var data: [Int] = []
    
    var size: Int {
        return self.data.count
    }
    
    var isEmpty: Bool {
        return self.data.isEmpty
    }
    
    var empty: Int {
        if self.isEmpty {
            return 1
        }
        return 0
    }
    
    var top: Int {
        if self.isEmpty {
            return -1
        }
        
        return self.data.last!
    }
    
    mutating func push(_ element: Int) {
        self.data.append(element)
    }
    
    mutating func pop() -> Int {
        if self.isEmpty {
            return -1
        }
        
        return self.data.removeLast()
    }
}

let n = Int(readLine()!)!
var stack = Stack()

for _ in 0..<n {
    let commands = readLine()!.split(separator: " ").map { element in
        return String(element)
    }
    
    switch commands[0] {
    case "push":
        stack.push(Int(commands[1])!)
    case "pop":
        print(stack.pop())
    case "size":
        print(stack.size)
    case "empty":
        print(stack.empty)
    case "top":
        print(stack.top)
    default:
        continue
    }
}
