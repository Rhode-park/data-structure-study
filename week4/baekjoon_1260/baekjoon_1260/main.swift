import Foundation

struct Queue<Element> {
    var elements :[Element] = []

    mutating func enqueue(_ value :Element) {
        elements.append(value)
    }

    var isEmpty :Bool {
        return elements.isEmpty
    }

    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

class Node {
    var data: Int
    var connections = [Node]()
    static var visitedNode = [Int]()
    
    init(_ data: Int) {
        self.data = data
    }
    
    func add(_ node: Node) {
        self.connections.append(node)
        self.connections.sort {
            $0.data < $1.data
        }
    }
    
    func DFS(_ visit: (Node) -> Void) {
        //Node.visitedNode.append(self.data)
        
        visit(self)
        
        connections.forEach {
            if !Node.visitedNode.contains($0.data) {
                $0.DFS(visit)
            }
        }
    }
    
    func BFS(_ visit: (Node) -> Void) {
        //Node.visitedNode.append(self.data)
        visit(self)
        
        var queue = Queue<Node>()
        
        connections.forEach {
            queue.enqueue($0)
        }
        
        while let node = queue.dequeue() {
            if !Node.visitedNode.contains(node.data) {
                //Node.visitedNode.append(self.data)
                visit(node)
                node.connections.forEach { queue.enqueue($0) }
            }
        }
    }
}

let input = readLine()?.components(separatedBy: " ").compactMap { Int($0) }

var nodeList = [Node(0)]

// input[0] = N : 정점 개수
for data in 1...(input?[0])! {
    nodeList.append(Node(data))
}

// input[1] = M : 간선 개수
for _ in 1...(input?[1])! {
    let nodeIndex = readLine()?.components(separatedBy: " ").compactMap { Int($0) }
    
    nodeList[nodeIndex![0]].add(nodeList[nodeIndex![1]])
    nodeList[nodeIndex![1]].add(nodeList[nodeIndex![0]])
}

// input[2] = V : 탐색을 시작할 노드
let index: Int = (input?[2])!

nodeList[index].DFS {
    Node.visitedNode.append($0.data)
    print($0.data, terminator: " ")
}

Node.visitedNode.removeAll()
print()

nodeList[index].BFS {
    Node.visitedNode.append($0.data)
    print($0.data, terminator: " ")
}
