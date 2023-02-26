var numbers = [2, 4, 6, 1]

print("Before sorted Array : \(numbers)")

for _ in 0..<numbers.count {
    var checker = true
    for j in 0..<numbers.count - 1 {
        if numbers[j] > numbers[j+1] {
            numbers.swapAt(j, j+1)
            checker = false
        }
    }
    if checker { break }
}

print("After sorted Array : \(numbers)")
