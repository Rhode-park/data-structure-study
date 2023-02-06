
// Level Order Traversal에 필요한 큐 구현
struct Queue<Element> {
    
    var elements: [Element] = []
    
    @discardableResult
    mutating func enqueue(_ value: Element) -> Bool {
        elements.append(value)
        return true
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

class TreeNode<T> {
    
    var value: T
    var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
}
extension TreeNode where T: Equatable {
    
    func forEachDepthFirst(_ visit:(TreeNode) -> Void) {
        
        visit(self) // rootNode
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
    
    func forEachLevelOrder(_ visit: (TreeNode) -> Void) {
        
        visit(self)
        var queue = Queue<TreeNode>() // root Node의 자식들은 미리 이 과정으로 인큐됨
        children.forEach {
           queue.enqueue($0)
        }
        while let node = queue.dequeue() { // 인큐된 값들의 자식들을 확인하고 큐에 넣어줌
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
    
    func search(_ value: T) -> TreeNode? {
        
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

let beverages = TreeNode<String>("beverages")

//let hot = TreeNode<String>("hot beverages")
//let cold = TreeNode<String>("cold beverages")

let hot = TreeNode("Hot")
let cold = TreeNode("Cold")
let tea = TreeNode("Tea")
let coffee = TreeNode("Coffee")

hot.add(tea)
hot.add(coffee)

let soda = TreeNode("Soda")
let milk = TreeNode("Milk")

cold.add(soda)
cold.add(milk)

beverages.add(hot)
beverages.add(cold)

//beverages.forEachDepthFirst {
//    print($0.value)
//}

//beverages.forEachLevelOrder {
//    print($0.value)
//}

if let searchResult = beverages.search("Milk") {
    print(searchResult.value)
}


/*
           beverages
           /   \
          /     \
          hot    cold
*/
