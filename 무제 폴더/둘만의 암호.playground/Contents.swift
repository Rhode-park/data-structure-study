import UIKit

func mapAscill(_ data: String) -> [Int] {
    var result: [Int] = []
    
    data.forEach { char in
        result.append(Int(UnicodeScalar(String(char))!.value))
    }
    
    return result
}

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let s = mapAscill(s)
    let skip = mapAscill(skip)
    var result = ""
    
    s.forEach { value in
        var value = value
        
        for _ in 0..<index {
            repeat {
                value += 1
                
                if value > 122 {
                    value = 97
                }
            } while skip.contains(value) == true
        }
        
        result.append(String(UnicodeScalar(value)!))
    }
    
    return result
}

solution("aukks", "wbqd", 5)
