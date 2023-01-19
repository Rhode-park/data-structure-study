//
//  main.swift
//  17829-222-풀링
//
//  Created by 강민수 on 2023/01/19.
//

func cutArray(x: Int, y: Int, arr: [[Int]]) -> [Int] {
    var temp: [Int] = []
    for tempX in x..<x+2 {
        for tempY in y..<y+2 {
            temp.append(arr[tempX][tempY])
        }
    }
    
    return temp
}

func pooling(n: Int, arr: [[Int]]) -> [[Int]] {
    var temp: [Int] = []
    var tempList: [Int] = []
    var answer: [[Int]] = []
    
    if arr.count == 1 {
        return arr
    } else {
        for x in stride(from: 0, to: n, by: 2) {
            for y in stride(from: 0, to: n, by: 2) {
                temp = cutArray(x: x, y: y, arr: arr)
                tempList.append(temp.sorted()[2])
                temp = []
            }
            answer.append(tempList)
            tempList = []
        }
        return pooling(n: n / 2, arr: answer)
    }
}

let n = Int(readLine()!)!
var arr: [[Int]] = []

for _ in 0..<n {
    let x = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append(x)
}

print(pooling(n: n, arr: arr)[0][0])

