//
//  main.swift
//  큐
//
//  Created by 강민수 on 2023/01/13.
//

struct Queue {
    private var data: [Int] = []
    
    var size: Int {
        return self.data.count
    }
    
    var empty: Int {
        return self.data.isEmpty ? 1: 0
    }
    
    var front: Int {
        if self.data.isEmpty {
            return -1
        }
        return self.data.first!
    }
    
    var back: Int {
        if self.data.isEmpty {
            return -1
        }
        return self.data.last!
    }
    
    mutating func push(_ element: Int) {
        self.data.append(element)
    }
    
    mutating func pop() -> Int {
        if self.data.isEmpty {
            return -1
        }
        return self.data.removeFirst()
    }
}

let n = Int(readLine()!)!
var queue = Queue()

for _ in 0..<n {
    let commands = readLine()!.split(separator: " ").map{ String($0) }
    
    switch commands[0] {
    case "push":
        queue.push(Int(commands[1])!)
    case "pop":
        print(queue.pop())
    case "size":
        print(queue.size)
    case "empty":
        print(queue.empty)
    case "front":
        print(queue.front)
    case "back":
        print(queue.back)
    default:
        continue
    }
}
