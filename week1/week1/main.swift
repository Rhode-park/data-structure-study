////
////  main.swift
////  week1
////
////  Created by kokkilE on 2023/01/09.
////
//
//class Node<T> {
//    var data: T
//    var next: Node<T>?
//
//    init(data: T, after: Node<T>? = nil) {
//        self.data = data
//        self.next = after
//    }
//}
//
//struct LinkedList<T> {
//    var head: Node<T>?
//    var tail: Node<T>?
//
//    var isEmpty: Bool {
//        get {
//            return head == nil
//        }
//    }
//
//    mutating func push(_ data: T) {
//        head = Node(data: data, after: head)
//
//        if tail == nil {
//            tail = head
//        }
//    }
//
//    mutating func append(_ data: T) {
//        if isEmpty {
//            push(data)
//            return
//        }
//
//        tail?.next = Node(data: data)
//        tail = tail?.next
//        tail?.next = nil
//    }
//
//    func insert(data: T, after node: Node<T>) {
//        node.next = Node(data: data, after: node.next)
//    }
//
//    func node(at index: Int) -> Node<T>? {
//            var currentIndex = 0
//            var currentNode = head
//
//            while(currentNode != nil && currentIndex < index) {
//                currentNode = currentNode?.next
//                currentIndex += 1
//            }
//            return currentNode
//        }
//
//    mutating func pop() -> Node<T>? {
//        defer {
//            head = head?.next
//
//            if isEmpty {
//                tail = nil
//            }
//        }
//
//        return head
//    }
//
//    mutating func removeLast() -> Node<T>? {
//        guard let head = head else {
//            return nil
//        }
//        guard head.next != nil else {
//            return pop()
//        }
//
//
//        var prev = head
//        var current = head
//
//        while let next = current.next {
//            prev = current
//            current = next
//        }
//
//        prev.next = nil
//        tail = prev
//        return current
//    }
//
//    mutating func remove(after node: Node<T>) -> T? {
//        defer {
//            if node.next === tail {
//                tail = node
//            }
//            node.next = node.next?.next
//        }
//        return node.next?.data
//    }
//}
//
//// Node 사이의 연결성 보여주기
//extension Node: CustomStringConvertible {
//    var description: String {
//        guard let next = next else {
//            return "\(data)"
//        }
//        return "\(data) ->" + String(describing: next) + " "
//    }
//}
//extension LinkedList: CustomStringConvertible {
//    var description: String {
//        guard let head = head else {
//            return "Empty List"
//        }
//        return String(describing: head)
//    }
//}
//
//
//var list = LinkedList<Int>()
//list.push(9)
//list.push(6)
//list.push(320)
//list.append(28)
//list.append(96)
//
//list.insert(data: 999, after: list.node(at: 1)!)
//
//print(list)
//
//list.pop()
//print(list)
//
//

///*
// 백준 1021: 회전하는 큐
// solved by 코낄이
// 2023.01.09 21:00 ~ 2023.01.10 01:00
//*/
//
//class Node<T> {
//    var data: T
//    var next: Node<T>?
//    var prev: Node<T>?
//
//    init(data: T, next: Node<T>? = nil, prev: Node<T>? = nil) {
//        self.data = data
//        self.next = next
//        self.prev = prev
//    }
//}
//
//struct List<T> {
//    var head: Node<T>?
//    var count = 0
//
//    mutating func push(data: Node<T>) {
//        guard head != nil else {
//            head = data
//            head?.prev = head
//            head?.next = head
//            return
//        }
//
//        data.next = head
//        data.prev = head?.prev
//        head?.prev?.next = data
//        head?.prev = data
//        head = data
//    }
//
//    mutating func pop() {
//        head?.next?.prev = head?.prev
//        head?.prev?.next = head?.next
//        head = head?.next
//    }
//
//    mutating func rotateRight() {
//        head = head?.prev
//    }
//
//    mutating func rotateLeft() {
//        head = head?.next
//    }
//
//    mutating func countForSearchRight(for data: T) -> Int {
//        var count = 0
//
//        while count < 50 &&
//                head?.data as! Int != data as! Int {
//            self.rotateRight()
//            count += 1
//        }
//
//        for _ in 0..<count {
//            self.rotateLeft()
//        }
//
//        return count
//    }
//
//    mutating func countForSearchLeft(for data: T) -> Int {
//        var count = 0
//
//        while count < 50 &&
//                head?.data as! Int != data as! Int {
//            self.rotateLeft()
//            count += 1
//        }
//
//        for _ in 0..<count {
//            self.rotateRight()
//        }
//
//        return count
//    }
//
//    mutating func popTargetDataAndCount(for data: T) {
//        let countRight = self.countForSearchRight(for: data)
//        let countLeft = self.countForSearchLeft(for: data)
//
//        if countLeft > countRight {
//            for _ in 0..<countRight {
//                self.rotateRight()
//                count += 1
//            }
//        } else {
//            for _ in 0..<countLeft {
//                self.rotateLeft()
//                count += 1
//            }
//        }
//
//        self.pop()
//    }
//}
//
//var list = List<Int>()
//
//var firstInput = readLine()!.split(separator: " ").compactMap {
//    Int($0) }
//var secondInput = readLine()!.split(separator: " ").compactMap {
//    Int($0) }
//
//for i in 1...firstInput[0] {
//    list.push(data: Node(data: firstInput[0] + 1 - i))
//}
//
//for target in secondInput {
//    list.popTargetDataAndCount(for: target)
//}
//
//print(list.count)

/*
 백준 1158: 요세푸스 문제
 solved by 코낄이
 2023.01.10 01:00 ~ 02:10
*/

class Node {
    var data: Int
    var next: Node?
    var prev: Node?
    
    init(_ data: Int) {
        self.data = data
    }
}

struct List {
    var head: Node?
    var isEmpty: Bool {
        return head == nil
    }
    
    
    mutating func push(_ node: Node) {
        guard !isEmpty else {
            head = node
            head?.next = head
            head?.prev = head
            return
        }
        
        node.next = head
        node.prev = head?.prev
        head?.prev?.next = node
        head?.prev = node
        head = node
    }
    
    mutating func pop() {
        guard head?.next !== head else {
            head = nil
            head?.prev = nil
            head?.next = nil
            return
        }
        
        head?.next?.prev = head?.prev
        head?.prev?.next = head?.next
        head = head?.next
    }
    
    mutating func rotateLeft(for count: Int) {
        guard count > 1 else {
            return
        }
        for _ in 1..<count {
            head = head?.next
        }
    }
    
    mutating func josephus(_ count: Int) -> [Int] {
        var someArray: [Int] = []
        
        while self.isEmpty == false {
            self.rotateLeft(for: count)
            if let data = head?.data {
                someArray.append(data)
            }
            self.pop()
        }
        
        return someArray
    }
}

var input = readLine()!.split(separator: " ").compactMap() {
    Int($0)
}

var list = List()

for i in 1...input[0] {
    list.push(Node(input[0] - i + 1))
}

let josephusArray = list.josephus(input[1])

print("<", terminator: "")
for i in 0..<josephusArray.count {
    if i == josephusArray.count - 1 {
        print("\(josephusArray[i])", terminator: "")
    } else {
        print("\(josephusArray[i]), ", terminator: "")
    }
}
print(">")

