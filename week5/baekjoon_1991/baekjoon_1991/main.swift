import Foundation

class TreeNode {
    var value: String
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    init(_ value: String) {
        self.value = value
    }
    
    func addChild(left: TreeNode?, right: TreeNode?) {
        if let leftNode = left,
           "A"..."Z" ~= leftNode.value {
            self.leftChild = leftNode
        }
        
        if let rightNode = right,
           "A"..."Z" ~= rightNode.value {
            self.rightChild = rightNode
        }
    }
    
    func traversePreOrder(visit: (TreeNode) -> Void) {
        visit(self)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traverseInOrder(visit: (TreeNode) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(self)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (TreeNode) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(self)
    }
}

let N: Int = (readLine()?.components(separatedBy: " ").compactMap{ Int($0) }[0])!
var treeNodes = [TreeNode]()
var alphabet = "A"

for _ in 0..<N {
    treeNodes.append(TreeNode(alphabet))
    
    let unicode = Int(UnicodeScalar(alphabet)!.value) + 1
    alphabet = String(UnicodeScalar(unicode)!)
}

for _ in 0..<N {
    let input: [String] = (readLine()?.components(separatedBy: " ").compactMap{ String($0) })!
    
    var parent: TreeNode?, left: TreeNode?, right: TreeNode?
    
    treeNodes.forEach {
        if $0.value == input[0] {
            parent = $0
        } else if $0.value == input[1] {
            left = $0
        } else if $0.value == input[2] {
            right = $0
        }
    }
    
    parent?.addChild(left: left, right: right)
}

treeNodes[0].traversePreOrder {
    print($0.value, terminator: "")
}
print()

treeNodes[0].traverseInOrder {
    print($0.value, terminator: "")
}
print()

treeNodes[0].traversePostOrder {
    print($0.value, terminator: "")
}
