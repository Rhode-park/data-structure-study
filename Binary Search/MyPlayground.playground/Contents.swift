extension Array where Element == Int {
    func containsUsingBinarySearch(_ value: Int) -> Bool {
        var lowerBound = 0
        var upperBound = self.count - 1
        var middle = 0
        var found = false

        while lowerBound <= upperBound {
            // find Middle
            middle = (lowerBound + upperBound) / 2
            
            if self[middle] == value {
                found = true
                break
            } else if self[middle] < value {
                lowerBound = middle + 1
            } else {
                upperBound = middle - 1
            }
        }
        
        return found
    }
}

func binarySearch(array: [Int], _ value: Int) -> Bool {
    var arr = array

    if arr.count == 1 {
        return arr[0] == value ? true : false
    }
    
    let middle = arr.count / 2
    
    if arr[middle] == value {
        return true
    } else {
        if arr[middle] < value {
            arr = Array(arr[(middle + 1)..<arr.count])
            return binarySearch(array: arr, value)
        } else {
            arr = Array(arr[0..<middle])
            return binarySearch(array: arr, value)
        }
    }
}

let numbers = [1, 5, 7, 17, 19, 22, 34]
print(numbers.containsUsingBinarySearch(19))

binarySearch(array: numbers, 19)
