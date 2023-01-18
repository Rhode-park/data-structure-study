//
//  main.swift
//  Stack 백준 17608
//
//  Created by jiye Yi on 2023/01/18.
//

struct Stack {
    var storage: [Int] = []
    var isEmpty: Bool {
        return storage.isEmpty
    }

    mutating func push(_ value: Int) {
        storage.append(value)
    }
    
    mutating func compareSize() {
        if !isEmpty, storage.last! >= storage[0] {
            storage.removeLast()
        }
    }
    
    mutating func size() -> Int {
        return storage.count
    }
}

let n = Int(readLine()!)!
var stack = Stack()
func makeStorage() {
    for _ in 0...n+1 {
        let input = readLine()!.split(separator: " ").map{ String($0) }
        stack.push(Int(input[0])!)
        print(stack.storage)
    }
}
makeStorage()
stack.compareSize()
print(stack.size())

