enum RectangleColor {
    case white, blue, mixed
}

// [Int] 배열을 받아서 전부 흰색인지, 전부 파란색인지, 두 색깔이 섞였는지 확인
func whatColor(_ array: [Int]) -> RectangleColor {
    var blueCount = 0, whiteCount = 0
    
    array.forEach {
        if $0 == 0 {
           whiteCount += 1
        } else if $0 == 1 {
            blueCount += 1
        }
    }
    
    if blueCount == 0 {
        return .white
    } else if whiteCount == 0 {
        return .blue
    } else {
        return .mixed
    }
}

// array 배열을 4개로 분할하여 반환 -> array1, array2, array3, array4
func quarterArray(from array: [Int], rowCount: Int) -> [[Int]] {
    var array1 = [Int]()
    var array2 = [Int]()
    var array3 = [Int]()
    var array4 = [Int]()
    
    for rowIndex in 0..<rowCount {
        for columnIndex in 0..<rowCount {
            if rowIndex < rowCount / 2 {
                if columnIndex < rowCount / 2 {
                    array1.append(array[(rowCount * (rowIndex)) + columnIndex])
                } else {
                    array2.append(array[(rowCount * (rowIndex)) + columnIndex])
                }
            } else {
                if columnIndex < rowCount / 2 {
                    array3.append(array[(rowCount * (rowIndex)) + columnIndex])
                } else {
                    array4.append(array[(rowCount * (rowIndex)) + columnIndex])
                }
            }
        }
    }
        
    return [array1, array2, array3, array4]
}

func checkAndRecursive(_ array: [Int], N: Int) {
    switch whatColor(array){
    case .white:
        whiteCount += 1
    case .blue:
        blueCount += 1
    case .mixed:
        quarterArray(from: array, rowCount: N).forEach {
            checkAndRecursive($0, N: N / 2)
        }
    }
}

var array = [Int]()
let N = Int(readLine()!)!

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0)! }
    
    for data in input {
        array.append(data)
    }
}
var blueCount = 0, whiteCount = 0
checkAndRecursive(array, N: N)

print(whiteCount)
print(blueCount)

