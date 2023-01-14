import UIKit

func power(number: Int, n: Int) -> Int {
    // base case
    if n == 0 {
        return 1
    } else {
        return number * power(number: number, n: n - 1) // Recursion case
    }
}

print(power(number: 2, n: 4))
