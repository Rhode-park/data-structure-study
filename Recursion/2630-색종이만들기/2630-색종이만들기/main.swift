//
//  main.swift
//  2630-색종이만들기
//
//  Created by 강민수 on 2023/01/20.
//

enum Color {
    // 0 - 하얀색, 1 - 파란색
    case white
    case blue
}

func cutQuarterIndex(arr: [[Int]], _ count: Int) -> [(Int, Int)] {
    var cuttingIndex: [(Int, Int)] = []
    
    for x in [0, count / 2] {
        for y in [0, count / 2] {
            cuttingIndex.append((x, y))
        }
    }
    
    return cuttingIndex
}

func cutQuarter(arr: [[Int]], _ index: (Int, Int), _ count: Int) -> [[Int]] {
    let (x, y) = index
    var cuttingArr: [[Int]] = []
    
    for xIndex in x..<x+count {
        var temp: [Int] = []
        for yIndex in y..<y+count {
            temp.append(arr[xIndex][yIndex])
        }
        
        cuttingArr.append(temp)
    }
    
    return cuttingArr
}

func validateColor(arr: [[Int]]) -> Color? {
    var paper = arr.joined().compactMap{ Int($0) }
    
    if paper.allSatisfy({ $0 == 0 }) {
        return .white
    } else if paper.allSatisfy({ $0 == 1 }) {
        return .blue
    } else {
        return nil
    }
}

func solution(n: Int, arr: [[Int]]) -> (Int, Int) {
    var whiteCount = 0
    var blueCount = 0
    
    let validation: Color? = validateColor(arr: arr)
    
    if validation == nil {
        let indexArr = cutQuarterIndex(arr: arr, n)
        
        for indexs in indexArr {
            let tempArr = cutQuarter(arr: arr, indexs, n / 2)
            var (tempWhite, tempBlue) = solution(n: n / 2, arr: tempArr)
            
            whiteCount += tempWhite
            blueCount += tempBlue
        }
    } else {
        if validation! == .white {
            whiteCount += 1
        } else {
            blueCount += 1
        }
    }
    
    return (whiteCount, blueCount)
}

//let n = 8
//let arr = [[1, 1, 0, 0, 0, 0, 1, 1],
//           [1, 1, 0, 0, 0, 0, 1, 1],
//           [0, 0, 0, 0, 1, 1, 0, 0],
//           [0, 0, 0, 0, 1, 1, 0, 0],
//           [1, 0, 0, 0, 1, 1, 1, 1],
//           [0, 1, 0, 0, 1, 1, 1, 1],
//           [0, 0, 1, 1, 1, 1, 1, 1],
//           [0, 0, 1, 1, 1, 1, 1, 1]]

let n = Int(readLine()!)!
var arr: [[Int]] = []

for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append(temp)
}


let (white, blue) = solution(n: n, arr: arr)

print(white)
print(blue)
