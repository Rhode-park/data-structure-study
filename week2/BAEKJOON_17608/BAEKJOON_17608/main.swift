//
//  main.swift
//  BAEKJOON_17608
//
//  Created by kokkilE on 2023/01/13.
//

func setStickArray() -> [Int] {
    var container = [Int]()
    let count = Int(readLine()!)!
    
    for _ in 0..<count {
        if let inputStick = readLine()?.split(
            separator: " ").compactMap({ Int($0) }).first {
            container.append(inputStick)
        }
    }
    
    return container
}

func countNumberOfStick() {
    var container = setStickArray()
    
    var currentHighestStick = 0
    var count = 0
    
    while !container.isEmpty {
        if currentHighestStick < container.last! {
            currentHighestStick = container.last!
            count += 1
        }
        
        container.popLast()
    }
    
    print(count)
}

countNumberOfStick()
