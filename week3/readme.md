# 17478 : 재귀함수가 뭔가요?

``` swift
func printMessage() {
    let question = underbarOfMessage + "\"재귀함수가 뭔가요?\""
    var answer = [String]()
    
    if underbarOfMessage.count / "____".count == N {
        answer = [underbarOfMessage + "\"재귀함수는 자기 자신을 호출하는 함수라네\""]
    } else {
        answer = [
            underbarOfMessage + "\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.",
            underbarOfMessage + "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.",
            underbarOfMessage + "그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\""
        ]
    }
    let teller = underbarOfMessage + "라고 답변하였지."
 
    underbarOfMessage += "____"
    
    print(question)
    answer.forEach { print($0) }
    
    while underbarOfMessage.count / "____".count <= N {
        printMessage()
    }
    
    print(teller)
}

let N: Int = Int(readLine()!)!
var underbarOfMessage = ""

print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")

printMessage()

```

---

# 17829 : 222-풀링

<img src="https://i.imgur.com/jIDlpZU.png" width=650>
<br><br>

``` swift
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

```

---

# 2630 : 색종이 만들기
``` swift
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


```
