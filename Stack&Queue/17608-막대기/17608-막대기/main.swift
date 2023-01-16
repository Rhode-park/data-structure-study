//
//  main.swift
//  17608-막대기
//
//  Created by 강민수 on 2023/01/15.
//

import Foundation

struct Stack {
    private var data: [Int] = []
    var isEmpty: Bool {
        return self.data.isEmpty
    }
    
    mutating func append(_ element: Int) {
        self.data.append(element)
    }
    
    mutating func removeLast() -> Int? {
        if self.isEmpty {
            return nil
        }
        
        return self.data.removeLast()
    }
    
    mutating func returnAnswer() -> Int {
        var answer = 1
        guard var threshold = self.removeLast() else { return answer }
        
        while isEmpty == false {
            guard let element = self.removeLast() else { return answer }
            if element > threshold {
                answer += 1
                threshold = element
            }
        }
        
        return answer
    }
}

let n = Int(readLine()!)!
var stack = Stack()

for _ in 0..<n {
    let element = Int(readLine()!)!
    
    stack.append(element)
}

print(stack.returnAnswer())

