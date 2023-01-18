# 백준 2164번 
N장의 카드가 있다. 각각의 카드는 차례로 1부터 N까지의 번호가 붙어 있으며, 1번 카드가 제일 위에, N번 카드가 제일 아래인 상태로 순서대로 카드가 놓여 있다.

이제 다음과 같은 동작을 카드가 한 장 남을 때까지 반복하게 된다. 우선, 제일 위에 있는 카드를 바닥에 버린다. 그 다음, 제일 위에 있는 카드를 제일 아래에 있는 카드 밑으로 옮긴다.

예를 들어 N=4인 경우를 생각해 보자. 카드는 제일 위에서부터 1234 의 순서로 놓여있다. 1을 버리면 234가 남는다. 여기서 2를 제일 아래로 옮기면 342가 된다. 3을 버리면 42가 되고, 4를 밑으로 옮기면 24가 된다. 마지막으로 2를 버리고 나면, 남는 카드는 4가 된다.

N이 주어졌을 때, 제일 마지막에 남게 되는 카드를 구하는 프로그램을 작성하시오. <br>
<img src="https://i.imgur.com/cU27DUO.png" width="550"/>

## :point_right: 1번 풀이 (배열로 스택 구현: 시간초과)
<details>
<summary>소스 코드</summary>
<div markdown="1">
    
``` swift
struct CardSet {
    var container = [Int]()
    var isEmpty: Bool {
        if container.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    mutating func setCards(_ numberOfCard: Int) {
        for data in 1...numberOfCard {
            container.append(data)
        }
    }
    
    mutating func popAndMovedDown() {
        // 제일 위 카드 버리기
        container.removeFirst()
        // 제일 위 카드를 제일 아래로 옮기기
        let lastCard = container.removeFirst()
        container.append(lastCard)
    }
    
    mutating func getLastCard() -> Int {
        while container.count > 1 {
            self.popAndMovedDown()
        }
        
        return container.removeFirst()
    }
}

var cardSet = CardSet()
let numberOfCard = Int(readLine()!)!

cardSet.setCards(numberOfCard)
print(cardSet.getLastCard())
```
</div>
</details>


### 시간 초과 원인
> container.removeFirst 할 때 마다 인덱스가 한 칸씩 당겨지는 연산이 필요
<img src="https://i.imgur.com/UE1MbEy.png" width="350"/>


## :point_right: 2번 풀이 (노드로 스택 구현)
<details>
<summary>소스 코드</summary>
<div markdown="1">

``` swift
class Node {
    var data: Int
    var next: Node?
    var prev: Node?
    
    init(_ data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct Stack {
    var head: Node?
    var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    var isOnlyOneNode: Bool {
        return head === tail
    }
    
    mutating func stackNode(_ data: Int) {
        head = Node(data, next: head)
        head?.next?.prev = head
        
        if tail == nil {
            tail = head
        }
    }
    
    mutating func pop() -> Node? {
        defer {
            head?.next?.prev = nil
            head = head?.next
            
            if isEmpty {
                tail = nil
            }
        }
        
        return head
    }
    
    mutating func moveHeadToTail() {
        let prevHead = self.pop()
        
        tail?.next = prevHead
        prevHead?.prev = tail
        tail = prevHead
    }
}

var cardStack = Stack()
let numberOfCard = Int(readLine()!)!

for data in 0..<numberOfCard {
    cardStack.stackNode(numberOfCard - data)
}

if !cardStack.isOnlyOneNode {
    cardStack.pop()
    
    while !cardStack.isOnlyOneNode {
        cardStack.moveHeadToTail()
        cardStack.pop()
    }
}

print((cardStack.head?.data)!)
```
</div>
</details>

## :point_right: 3번 풀이 (백준 컨닝)
<details>
<summary>소스 코드</summary>
<div markdown="1">

``` swift
var cardStack = [Int]()
let numberOfCard = Int(readLine()!)!
var headPointer = 0

for data in 1...numberOfCard {
    cardStack.append(data)
}
    
for _ in 0..<(numberOfCard-1) {
    headPointer += 1
    cardStack.append(cardStack[headPointer])
    headPointer += 1
}

print(cardStack[headPointer == 0 ? headPointer : headPointer - 1])
// print(cardStack[headPointer - 1])
```
</div>
</details>

<img src="https://i.imgur.com/CqIbIHC.png" width="350"/>
<br>[개발자 소들이 - Swift) 큐(Queue) 구현 해보기](https://babbab2.tistory.com/84)
