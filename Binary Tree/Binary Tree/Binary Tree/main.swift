class BinaryTree<Element> {
    var value: Element
    var leftChild: BinaryTree?
    var rightChild: BinaryTree?
    
    init(value: Element, leftChild: BinaryTree? = nil, rightChild: BinaryTree? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(self.value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(self.value)
    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        visit(self.value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
}

let root = BinaryTree(value: 10)
let levelOneLeft = BinaryTree(value: 9)
let levelOneRight = BinaryTree(value: 2)
let levelTwoOneLeftLeft = BinaryTree(value: 1)
let levelTwoOneLeftRight = BinaryTree(value: 3)
let levelTwoOneRightLeft = BinaryTree(value: 4)
let levelTwoOneRightRight = BinaryTree(value: 6)

root.leftChild = levelOneLeft
root.rightChild = levelOneRight

levelOneLeft.leftChild = levelTwoOneLeftLeft
levelOneLeft.rightChild = levelTwoOneLeftRight

levelOneRight.leftChild = levelTwoOneRightLeft
levelOneRight.rightChild = levelTwoOneRightRight

root.traverseInOrder { value in
    print(value, terminator: " ")
}
print()
root.traversePostOrder { value in
    print(value, terminator: " ")
}
print()
root.traversePreOrder { value in
    print(value, terminator: " ")
}
