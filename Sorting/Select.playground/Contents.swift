import Foundation

func selectionSort(_ array: inout [Int]) {
    var min: Int = 0

    for i in 0..<array.count {
        min = i
        for j in i + 1..<array.count {
            if(array[j] < array[min]) {
                min = j
            }
        }
        array.swapAt(min, i)
    }
}

var array = [8, 5, 2, 6, 9, 3, 1, 4, 0, 7]
selectionSort(&array)

var numbers = [8, 5, 2, 6, 9, 3, 1, 4, 7]

var minIndex = 0

for i in 0..<numbers.count {
    minIndex = i
    
    for j in (i+1)..<numbers.count {
        if numbers[j] < numbers[minIndex] {
            minIndex = j
        }
        
        numbers.swapAt(i, minIndex)
    }
}
print(numbers)

