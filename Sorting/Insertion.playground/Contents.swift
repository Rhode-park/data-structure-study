var numbers = [12,34,66,9,99,2,1,5,6]

for i in 0..<numbers.count {
    
    let key = numbers[i]    // 9
    var j = i - 1   // 2
    
    while(j >= 0 && numbers[j] > key) {
        numbers[j+1] = numbers[j]
        j = j - 1
    }
    numbers[j + 1] = key
}

print(numbers)
