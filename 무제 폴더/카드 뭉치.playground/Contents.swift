import Foundation

// MARK: - 첫번째 풀이(실패)

//func haveWord(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> Bool {
//    var result = false
//
//    goal.forEach { word in
//        if cards1.contains(word) || cards2.contains(word) {
//            result = true
//        } else {
//            result = false
//            return
//        }
//    }
//
//    return result
//}
//
//func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
//    if haveWord(cards1, cards2, goal) == false {
//        return "No"
//    }
//
//    var cards1 = cards1
//    var cards2 = cards2
//
//    goal.forEach { word in
//        if cards1.first == word {
//            cards1.removeFirst()
//        } else if cards2.first == word {
//            cards2.removeFirst()
//        } else {
//            return
//        }
//    }
//
//    return cards1.isEmpty && cards2.isEmpty == true ? "Yes" : "No"
//}
//
//solution(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"])

// MARK: - 두번째 풀이(성공)

enum Result {
    case success
    case failure

    var value: String {
        switch self {
        case .success:
            return "Yes"
        case .failure:
            return "No"
        }
    }
}

func haveWord(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> Bool {
    var result = false

    goal.forEach { word in
        if cards1.contains(word) || cards2.contains(word) {
            result = true
        } else {
            result = false
            return
        }
    }

    return result
}

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    if haveWord(cards1, cards2, goal) == false {
        return Result.failure.value
    }

    var cards1 = cards1
    var cards2 = cards2
    var result: Result = .success

    goal.forEach { word in
        if cards1.first == word {
            cards1.removeFirst()
        } else if cards2.first == word {
            cards2.removeFirst()
        } else {
            result = .failure
            return
        }
    }

    return result.value
}

// MARK: - 세번째 풀이
//enum Result {
//    case success
//    case failure
//
//    var value: String {
//        switch self {
//        case .success:
//            return "Yes"
//        case .failure:
//            return "No"
//        }
//    }
//}
//
//class Node {
//    let value: String
//    var next: Node?
//
//    init(value: String, next: Node? = nil) {
//        self.value = value
//        self.next = next
//    }
//}
//
//struct LinkedList {
//    var head: Node?
//    var tail: Node?
//    var peek: String? {
//        return self.head?.value
//    }
//
//    init(data: [String]) {
//        data.forEach { word in
//            let node = Node(value: word)
//
//            if head == nil && tail == nil {
//                self.head = node
//                self.tail = node
//            } else {
//                self.tail?.next = node
//                self.tail = node
//            }
//        }
//    }
//
//    mutating func removeFirst() {
//        let firstNode = self.head
//
//        self.head = firstNode?.next
//
//        firstNode?.next = nil
//    }
//}
//
//func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
//    var cards1 = LinkedList(data: cards1)
//    var cards2 = LinkedList(data: cards2)
//    var result: Result = .success
//
//    goal.forEach { word in
//        if cards1.peek == word {
//            cards1.removeFirst()
//        } else if cards2.peek == word {
//            cards2.removeFirst()
//        } else {
//            result = .failure
//            return
//        }
//    }
//
//    return result.value
//}

