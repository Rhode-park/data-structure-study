// BinaryNode를 이용한 BinaryTree 구현
class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: Element) {
        self.value = value
    }
}
/*
        10
       /  \
      9    2
     / \  / \
    1  3  4  6
 
 */

let ten = BinaryNode(10)
let nine = BinaryNode(9)
let two = BinaryNode(2)
let one = BinaryNode(1)
let three = BinaryNode(3)
let four = BinaryNode(4)
let six = BinaryNode(6)

ten.leftChild = nine
ten.rightChild = two
nine.leftChild = one
nine.rightChild = three
two.leftChild = four
two.rightChild = six

// MARK: In order Traversal: left Node 부터 확인  0-1-5-7-8-9
/*
        7
      /  \
     1   9
    / \  /
   0  5  8
 */

extension BinaryNode {
    
    func traverseInOrder(visit: (Element) -> Void) {
        
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Element) -> Void) {
        
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
}

ten.traverseInOrder {
    print($0)
}

/*
        10
       /  \
      9    2
     / \  / \
    1  3  4  6
 
 print:
 1 9 3 10 4 2 6
 
 */

// MARK: Post Order Traversal: 0-5-1-8-9-7 , child 부터 확인하는 방법
/*
        7
      /  \
     1   9
    / \  /
   0  5  8
 */

/*
        10
       /  \
      9    2
     / \  / \
    1  3  4  6
 
 stack:
 10 //printOut-7
 9 // printOut-3
 1 // printOut-1
 3 // printOut-2
 2 // printOut-6
 4 // printOut-4
 6 // pirntOut-5
 
 print:
 1 3 9 4 6 2 10
 
 */

// MARK: Pre Order Traversal : 7-1-0-5-9-8, root 부터 확인 -> leftChild
/*
        7
      /  \
     1   9
    / \  /
   0  5  8
 */

/*
        10
       /  \
      9    2
     / \  / \
    1  3  4  6
 

 print:
 10-9-1-3-2-4-6
 
 */
ten.traversePreOrder {
    print($0)
}
