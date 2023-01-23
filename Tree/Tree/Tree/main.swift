//
//  main.swift
//  Tree
//
//  Created by 강민수 on 2023/01/21.
//

import Foundation

struct Queue<Element> {
    var elements: [Element] = []
    
    mutating func enqueue(_ value: Element) {
        self.elements.append(value)
    }
    
    mutating func dequeue() -> Element? {
        if self.elements.count < 1 {
            return nil
        }
        
        return self.elements.removeFirst()
    }
}

class TreeNode<T> where T: Equatable {
    var value: T
    var children: [TreeNode] = []
    
    init(value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
}

extension TreeNode {
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
    
    func forEachLevelOrder(_ visit: (TreeNode) -> Void) {
        visit(self)
        
        var queue = Queue<TreeNode>()
        
        children.forEach {
            queue.enqueue($0)
        }
        
        while let node = queue.dequeue() {
            visit(node)
            
            node.children.forEach {
                queue.enqueue($0)
            }
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

let beverage = TreeNode(value: "Beverage")

let hot = TreeNode(value: "Hot")
let cold = TreeNode(value: "Cold")

let tea = TreeNode(value: "Tea")
let coffee = TreeNode(value: "coffee")

let soda = TreeNode(value: "soda")
let milk = TreeNode(value: "milk")

beverage.add(hot)
beverage.add(cold)
hot.add(tea)
hot.add(coffee)
cold.add(soda)
cold.add(milk)

//beverage.forEachDepthFirst {
//    print($0.value)
//}

//beverage.forEachLevelOrder {
//    print($0.value)
//}

if let searchValue = beverage.search("Milk") {
    print(searchValue.value)
}
