

struct Tree {
    var value: Int
    var childrens: [Tree] = []
    var isVisited = false
    
    init(value: Int) {
        self.value = value
    }
    
    mutating func append(_ child: Tree) {
        self.childrens.append(child)
        self.childrens.sort { $0.value < $1.value }
    }
}

var temp = readLine()!.split(separator: " ").map { Int($0)! }

let n = temp[0]
let m = temp[1]
let v = temp[2]

var treeArray = Array(repeating: Tree(value: 0), count: n)

for _ in 0..<m {
    temp = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = temp[0]
    let child = temp[1]
    
    treeArray[parent-1].value = parent
    treeArray[child-1].value = child
    treeArray[parent-1].append(treeArray[child-1])
}

var dfsTree = treeArray[v - 1]
var bfsTree = treeArray[v - 1]

dfsTree.DFS()
print()
bfsTree.BFS()
print()
