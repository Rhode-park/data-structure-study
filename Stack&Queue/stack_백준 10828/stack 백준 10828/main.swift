struct Stack {
    private var storage: [Int] = []

    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var size: Int {
        return storage.count
    }
    
    mutating func push(_ value: Int) {
        storage.append(value)
    }
    
    mutating func pop() -> Int {
        guard !isEmpty else {
            return -1
        }
        return storage.popLast()!
    }
    
    mutating func checkEmpty() -> Int {
        if isEmpty {
            return 1
        } else {
            return 0
        }
    }
    
    mutating func top() -> Int {
        guard !isEmpty else {
            return -1
        }
        return storage.last!
    }
}

let n = Int(readLine()!)!
var stack = Stack()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ element in
        return String(element)
    }
    
    switch input[0] {
    case "push":
        stack.push(Int(input[1])!)
    case "pop":
        print(stack.pop())
    case "size":
        print(stack.size)
    case "empty":
        print(stack.checkEmpty())
    case "top":
        print(stack.top())
    default:
        continue
    }
}
