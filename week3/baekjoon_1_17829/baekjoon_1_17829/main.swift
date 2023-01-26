func quarterArray(from array: [Int], rowCount: Int) -> [Int] {
    guard rowCount != 1 else {
        return array
    }
    
    var afterArray = [Int]()
    var columnIndex = 0
    var rowIndex = 0

    while rowIndex < rowCount {
        while columnIndex < rowCount {
            let twoByTwo = [
                array[(rowCount * (rowIndex)) + columnIndex],
                array[(rowCount * (rowIndex)) + (columnIndex + 1)],
                array[(rowCount * (rowIndex + 1)) + columnIndex],
                array[(rowCount * (rowIndex + 1)) + (columnIndex + 1)]
            ]
            
            afterArray.append(twoByTwo.sorted {$0 > $1}[1])
            
            columnIndex += 2
        }
        
        columnIndex = 0
        rowIndex += 2
    }

    return quarterArray(from: afterArray, rowCount: Int(rowCount / 2))
}

var array = [Int]()
let N = Int(readLine()!)!

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0)! }
    
    for data in input {
        array.append(data)
    }
}

let target = quarterArray(from: array, rowCount: N)
print(target[0])
