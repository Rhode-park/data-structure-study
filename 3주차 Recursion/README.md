# 연결 리스트 Linked List WIL
## 연결 리스트란?
데이터와 링크로 구성된 노드를 이용하여 메모리에 저장된 순서와 상관없이 연결된 데이터 구조를 말한다. 연결 리스트에는 크게 세가지의 종류가 있다.  

 - 단일 연결 리스트(Singly linked list) : 자료 공간 1개와 다음 노드를 가리키는 포인터로 구성된 노드를 가지는 연결 리스트
 - 이중 연결 리스트(Doubly linked list) : 앞의 노드와 뒤의 노드를 가리키는 포인터가 2개 있는 연결 리스트
 - 순환 연결 목록(Circular linked list) : 마지막 노드와 처음 노드가 연결되어 원형 구조를 이루고 있는 연결 리스트

일반적으로 연결 리스트라고 하면, 이 중에서 단일 연결 리스트를 의미한다.

![](https://i.imgur.com/4Vq2v1S.png)

위는 단일 연결 리스트의 구조를 나타낸 그림이다. 각각의 사각형은 Node를 의미한다. Node는 데이터(채색되어 있지 않은 부분)와 링크(채색되어 있는 부분)로 나뉘는데 데이터에는 저장하길 원하는 값을 넣고, 링크에는 다음 노드를 가리키도록 하여 연결 리스트를 구현할 수 있다. 

![](https://i.imgur.com/P2uLdLH.png)

중간 element를 삭제할 때에는 위 그림처럼 삭제하고자하는 element를 가리키는 Node를 그 다음 element를 가리키도록 하면 된다. 즉, B를 가리키는 Node가 C를 가리키도록 하면 된다. 

![](https://i.imgur.com/ObfJ4mq.png)

중간 element를 삽입할 때에도 비슷하다. B를 가리키는 Node가 I를 가리키도록 하고, I의 노드는 B를 가리키면 된다.

### 시간 복잡도
 **삽입, 삭제**: O(1)
 다음 노드의 위치를 가지고 있기 때문에 중간 element를 삽입, 삭제해도 연산의 오버헤드가 발생하지 않아 O(1)의 시간복잡도로 처리할 수 있다. *하지만, 현실적으로 가장 기초적인 연결 리스트는 탐색 후 삽입, 삭제를 해야하므로 O(N+1)을 요구한다.* head나 tail 앞이나 뒤에 새로운 노드를 삽입하면 탐색이 필요없기 때문에 O(1)에 삽입이 가능하다. 
 
**탐색**: O(N)
인덱스를 통한 Random Access가 불가능하고, 원하는 데이터가 나올 때까지 탐색해야하기 때문에 O(N)의 시간 복잡도가 요구된다.

<br/>

## 연결 리스트의 장단점(cf.배열)

### 장점
다음 노드의 위치를 가지고 있기 때문에 연속적으로 저장할 필요가 없다. 그래서 중간 element를 삽입, 삭제를 해도 재배치에서 연산의 오버헤드가 발생하지 않는다. 그 결과 삽입, 삭제에 O(1)의 시간 복잡도가 걸린다.~~(하지만, 현실적으로 가장 기초적인 연결 리스트는 탐색 후 삽입, 삭제를 해야하므로 O(N+1)을 요구한다.)~~

### 단점
배열과 달리 swift에서는 따로 제공하는 타입이 없어 직접 구현을 해야하는 번거로움이 있다. 또한 내 다음 데이터에 대한 연결 정보를 저장하는 별도의 공간이 필요해서, 노드 관리에 일정량의 메모리가 소진된다. 그리고 배열과 달리 인덱스를 통한 Random Access가 불가능하여 처음부터 원하는 데이터가 나올 때까지 탐색해야한다. 예를 들어 데이터가 100개인데, 100번째 데이터에 접근하려고 하면 100번을 순회해야한다는 것이다. 따라서 탐색에 O(N)의 시간 복잡도가 요구된다. 덧붙여 포인터 기반이기 때문에 디버깅이 어렵다.


### 배열과의 비교

|  |  장점  |  단점  |
| -------- | -------- | -------- |
| 배열   | ▪️ 구현이 쉽다. <br/> ▪️ 인덱스 값을 알고 있는 경우 빠르게 데이터에 접근할 수 있다. | ▪️ 중간 element 삽입, 삭제시 자료의 이동이 빈번하다. <br/> ▪️ 크기가 고정되어있다. <br/>|
| 연결 리스트  | ▪️ 다음 노드의 위치를 가지고 있기 때문에 연속적으로 저장할 필요가 없다. <br/> ▪️ 삽입, 삭제시 자료의 이동이 없다. <br/> ▪️ 중간 element를 삽입, 삭제를 해도 재배치에서 연산의 오버헤드가 발생하지 않는다. <br/> ▪️ 삽입, 삭제에 O(1)의 시간 복잡도가 걸린다.   | ▪️ 구현을 직접 해야하는 번거로움이 있다. <br/> ▪️ 노드 관리에 일정량의 메모리가 소진된다. <br/> ▪️ 인덱스를 통한 Random Access가 불가능하다. <br/> ▪️ 처음부터 원하는 데이터가 나올 때까지 탐색해야하기 때문에 탐색에 O(N)의 시간 복잡도가 요구된다.  <br/> ▪️ 포인터 기반이라 디버깅이 어렵다. |


<br/>

## 연결 리스트 구현하기
### 노드 클래스 구현하기
다음과 같은 방법들로 노드 클래스를 구현할 수 있다.
```swift
class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
```

우선 데이터의 타입이 국한되지 않도록 <T>를 사용해주었다. [T에 대해 더 알고 싶다면 클릭.](https://babbab2.tistory.com/136) 그리고 데이터와 링크를 각각 ```data```와 ```next```로 명명하였다. ```next```는 다음 Node를 가리키기 위한 변수이다. 이때, 꼬리가 기리키는 것이 nil이기 때문에 ```next```의 타입은 옵셔널을 가진다. 
    
```swift
let node1 = Node(data: 3)
let node2 = Node(data: 2)
let node3 = Node(data: 0)
```
node1, 2, 3을 지정하고 data값을 주었다.
    
```swift
node1.next = node2
node2.next = node3
```
위와 같은 방법을 통해서 node1, 2, 3 사이의 연결성을 만들었다.
    
<details>
<summary>node 사이의 연결성 보여주기</summary>

```swift
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(data)"
        }
        return "\(data) ->" + String(describing: next) + " "
    }
}
    
print(node1)  //3 ->2 ->0  
```

</details>
    

### 연결 리스트 구조 구현하기

```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    init() { }
}

let list = LinkedList<Int>()
```
    
### Push 구현하기
    
![](https://i.imgur.com/5JcCwDg.png)
![](https://i.imgur.com/UTLw8dD.png)
    
원래 선두였던 B 앞에 A가 붙으면서 A가 선두가 된다. Push 작업은 Head가 있던 자리에 새로운 값을 밀어넣어 새 노드에 값을 할당한다.

```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    mutating func push(_ data: T) {
        head = Node(data: data, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    init() { }
}
```
위와 같은 방식으로 push를 struct 안에 정의할 수 있다.
    
<details>
<summary>node 사이의 연결성 보여주기</summary>
    
```swift
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}
```
</details>
    

```swift
var list = LinkedList<Int>()
list.push(9)
list.push(6)
list.push(320)

print(list)  //320 ->6 ->9

```
그리고 이렇게 9, 6, 320을 push해주면 320 ->6 -> 9의 순서로 출력이 된다. 9, 6, 320의 순서로 Head쪽에서 밀고들어온 것을 알 수 있다. 그리고 최종적으로 push한 320이 Head가 된다.
    
<br/>
    
### Append 구현하기
![](https://i.imgur.com/sDjZj5I.png)
![](https://i.imgur.com/iV1AHu2.png)
    
원래 마지막이었던 C 뒤에 D가 붙으면서 D가 마지막이 된다. Append 작업은 Tail이 있던 자리에 새로운 값을 밀어넣어 새 노드에 값을 할당한다.
    
```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    mutating func push(_ data: T) {
        head = Node(data: data, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    //여기서부터
    mutating func append(_ data: T) {
        guard !isEmpty else {
            push(data)
            return
        }
        let node = Node(data: data)
        tail!.next = node
        tail = node
    }
    //여기까지
    
    init() { }
}
```
    
<details>
<summary>node 사이의 연결성 보여주기</summary>
    
```swift
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}
```
</details>
    
```swift
var list = LinkedList<Int>()
list.push(9)
list.push(6)
list.push(320)
list.append(28)
list.append(96)


print(list)  //320 ->6 ->9 ->28 ->96
```
그리고 이렇게 28, 96을 append해주면 320 ->6 -> 9 ->28 ->96의 순서로 출력이 된다. 28, 96의 순서로 Tail쪽에서 밀고들어온 것을 알 수 있다. 그리고 최종적으로 append한 96이 Tail이 된다.
    
    
<br/>
    
### Insert 구현하기    
![](https://i.imgur.com/ObfJ4mq.png)

특정 노드 뒤에 노드를 삽입하는 것이다.
    
```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    mutating func push(_ data: T) {
        head = Node(data: data, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    //여기서부터
    func node(at index: Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    func insert(_ data: T, after node: Node<T>) {
        node.next = Node(data: data, next: node.next)
    }
    //여기까지
    
    mutating func append(_ data: T) {
        guard !isEmpty else {
            push(data)
            return
        }
        let node = Node(data: data)
        tail!.next = node
        tail = node
    }
    
    init() { }
}
```
    
<details>
<summary>node 사이의 연결성 보여주기</summary>
    
```swift
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}
```
</details>
    
```swift
var list = LinkedList<Int>()
list.push(9)
list.push(6)
list.push(320)
list.append(28)
list.append(96)

let middleNode = list.node(at: 1)!

list.insert(999, after: middleNode)


print(list)  //320 ->6 ->999 ->9 ->28 ->96
```

1번째 노드인 6 뒤에 999가 삽입된 것을 볼 수 있다.
    
<br/>
    
### Pop 구현하기
![](https://i.imgur.com/UTLw8dD.png)
![](https://i.imgur.com/5JcCwDg.png)
    
원래 선두였던 A가 사라지고 그 다음 노드인 B가 Head가 된다. 
    
```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    mutating func push(_ data: T) {
        head = Node(data: data, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    func node(at index: Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    func insert(_ data: T, after node: Node<T>) {
        node.next = Node(data: data, next: node.next)
    }
    
    //여기서부터
    mutating func append(_ data: T) {
        guard !isEmpty else {
            push(data)
            return
        }
        let node = Node(data: data)
        tail!.next = node
        tail = node
    }
    //여기까지
    
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.data
    }
    
    init() { }
}
```
    
<details>
<summary>node 사이의 연결성 보여주기</summary>
    
```swift
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}
```
</details>
    
```swift
var list = LinkedList<Int>()
list.push(9)
list.push(6)
list.push(320)
list.append(28)
list.append(96)

let middleNode = list.node(at: 1)!

list.insert(999, after: middleNode)

list.pop()


print(list)  //6 ->999 ->9 ->28 ->96
```
Head였던 320이 사라지고 6이 Head가 된 것을 볼 수 있다.
    
    
<br/>
    
### Remove Last 구현하기
![](https://i.imgur.com/iV1AHu2.png)
![](https://i.imgur.com/sDjZj5I.png)
    
원래 마지막이었던 D가 사라지고 C가 Tail이 된다.
```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    mutating func push(_ data: T) {
        head = Node(data: data, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    func node(at index: Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    func insert(_ data: T, after node: Node<T>) {
        node.next = Node(data: data, next: node.next)
    }
    
    mutating func append(_ data: T) {
        guard !isEmpty else {
            push(data)
            return
        }
        let node = Node(data: data)
        tail!.next = node
        tail = node
    }
    
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.data
    }
    
    //여기서부터
    mutating func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.data
    }
    //여기까지
    
}
```

<details>
<summary>node 사이의 연결성 보여주기</summary>
    
```swift
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}
```
</details>
    
```swift
var list = LinkedList<Int>()
list.push(9)
list.push(6)
list.push(320)
list.append(28)
list.append(96)

let middleNode = list.node(at: 1)!

list.insert(999, after: middleNode)

list.pop()
list.removeLast()


print(list)  //6 ->999 ->9 ->28
```
Tail에 위치해있던 96이 사라지고 28이 새로운 Tail이 되었다.
    
<br/>
    
### Remove After 구현하기
![](https://i.imgur.com/P2uLdLH.png)

```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    mutating func push(_ data: T) {
        head = Node(data: data, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    func node(at index: Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = head
        
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    func insert(_ data: T, after node: Node<T>) {
        node.next = Node(data: data, next: node.next)
    }
    
    mutating func append(_ data: T) {
        guard !isEmpty else {
            push(data)
            return
        }
        let node = Node(data: data)
        tail!.next = node
        tail = node
    }
    
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.data
    }
    
    mutating func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.data
    }
    
    //여기서부터
    mutating func remove(after node: Node<T>) -> T? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.data
    }
    //여기까지
    
}
```

<details>
<summary>node 사이의 연결성 보여주기</summary>
    
```swift
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}
```
</details>
    
```swift
var list = LinkedList<Int>()
list.push(9)
list.push(6)
list.push(320)
list.append(28)
list.append(96)

let middleNode = list.node(at: 1)!

list.insert(999, after: middleNode)

list.pop()
list.removeLast()

let index = 1
let node = list.node(at: index - 1)!
let removedValue = list.remove(after: node)


print(list)  //6 ->9 ->28

```
1번째 노드인 6 뒤에 있는 999가 사라졌다. 
    
    
<br/>
    
## 같이 해볼 활동
#### Step01: 노드 클래스 구현하기
 - push, append를 사용하지 않고 노드 클래스를 만들어보세요!
 - "2 -> 0 -> 2 -> 3 -> 0 -> 1 -> 0 -> 4"가 출력되도록 해보세요!
    
#### Step02: push, append, insert를 사용하여 노드 클래스 구현하기
 - push, append, insert만을 사용해서 노드 클래스를 만들어보세요!
 - "2 -> 0 -> 2 -> 3 -> 0 -> 1 -> 0 -> 4"가 출력되도록 해보세요!

#### Step03: pop, removeLast를 사용하여 노드 클래스 구현하기
 - pop, removeLast를 사용해서 step02의 노드 클래스를 수정해보세요!
 - "2 -> 3 -> 0 -> 1"가 출력되도록 해보세요!

#### Step04: removeAfter를 사용하여 노드 클래스 구현하기
 - removeAfter을 사용해서 step03의 노드 클래스르 수정해보세요!
 - "2 -> 1"가 출력되도록 해보세요!

    
<br/>
<br/>



참조
[Swift) 단방향 연결 리스트(LinkedList) 구현 해보기](https://babbab2.tistory.com/86)
    
[swift로 구현한 연결리스트(Linked List)](https://gimjinging.tistory.com/90)

[[Swift] Linked List 구현](https://taeminator1.tistory.com/36)
    
