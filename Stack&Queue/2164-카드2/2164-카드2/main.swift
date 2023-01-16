//
//  main.swift
//  2164-카드2
//
//  Created by 강민수 on 2023/01/15.
//

import Foundation

struct Queue {
    private var data: [Int?] = []
    var head = 0
    
    var count: Int {
        return self.data.count
    }
    
    init(n: Int) {
        self.data = Array(1...n)
    }
    
    mutating func enqueue(_ element: Int) {
        self.data.append(element)
    }
    
    mutating func action() -> Int? {
        while data[head] != data.last {
            head += 1
            guard let value = data[head] else { return data[head] }
            enqueue(value)
            head += 1
        }
        
        return data[head]
    }
}


let n = Int(readLine()!)!
var queue = Queue(n: n)

if let value = queue.action() {
    print(value)
}
