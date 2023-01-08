# Complexity
![](https://i.imgur.com/GnGKkQN.png)

- **Constant Time** : 코드를 수행할때 처리하는 데이터가 증가해도 시간은 변하지 않을 때 (Excellent) 
- **Linear Time** : 처리하는 데이터가 많아질수록 시간도 많이 드는 경우 (horrible, bad의 경계) 
- **Quadratic Time** : 처리하는 데이터의 양과 상관없이 시간이 엄청나게 많이 소요되는 경우 (O(n!))
- **Logarithmic Time** : 처리하는 데이터의 양이 많아져도 소요되는 시간은 비슷할때 (Constant Time은 아예 일직선이지만 이 경우는 Good영역에서 약간의 커브를 그린다.), 예를들어 100개의 item을 가진 array에서 1개의 item을 찾을때 linear 구조는 하나씩 확인하지만 binary 구조는 반씩 나눠서 찾기 때문에 이 경우에 속한다.
- **Quasilinear Time** : Linear time의 구조를 사용. Quadratic Time 보다 quality, time, complexity 측면에서 좋다.


# Linked List 
> 노드들이 연결되어 이루어진 자료 구조

- Node는 Data(값)와 Link(위치)로 구성되어 있다.
- 각각 떨어진 공간에 존재하는 데이터를 연결
- 원하는 경우 메모리에 공간을 할당해서 사용하고 재배치에 오버헤드가 발생하지 않는다.



|  | 배열 | 연결리스트 |
| -- | --- | ----- |
|    장점      |    - 인덱스 값을 미리 아는 경우, 데이터에 신속한 접근 가능 </br> - 새로운 요소 삽입이 빠름 |    - 데이터 삽입 및 삭제 속도가 빠름      |
| 단점     | - 크기가 고정되고, 삭제 및 검색이 느림     | - 검색속도가 느림 </br> - 저장공간 효율이 높지 않음     |

## Node 구현

```swift
class Node<Value> {
    
    var value: Value
    var next: Node? //위치를 나타내는 next는 LinkedList 마지막 값이 nil일수 있으므로 옵셔널로 처리
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
```
- Node를 관리하는 class Node 선언
- 초기값으로 next 다음위치의 노드는 nil 값을 부여해준다.

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
- CustomStringConvertible 프로토콜을 준수하여 옵셔널 바인딩을하여 출력문에서 깔끔하게 출력되도록 해준다.
- 위 프로토콜을 사용할때 반드시 ```description``` 읽기전용 프로퍼티를 선언하여 타입을 명시해주어야 한다.
- String 타입을 명시하였으므로 String 타입으로 반환된다.

```swift
extension Node : CustomStringConvertible {
    
    var description: String {
        
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}
```
- 위의 구문과 마찬가지로 프로토콜을 준수하여 출력했을 때 화살표를 넣어 노드의 방향을 확인하기 쉽도록 코드를 작성한다.

```swift
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print(node1) // print(1 -> 2 -> 3)
```

- node1의 값은 1이고, node1.next = node2 (2) 이므로 ```1 -> 2 ```연결
- 마찬가지로 node2 (2) 와 node2.next = node3 (3) 을 연결하여``` 1 -> 2 -> 3 ```출력
## LinkedList 구현
```swift
struct LinkedList<Value> {
    // head, tail 을 만들어줌
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
```
- ```<Value>``` 는 제네릭 타입으로 선언한 것을 뜻한다. 제네릭 타입이란, 타입에 의존하지 않고 사용하고 싶을때 선언한다. 실제 함수가 호출될때 해당 매개변수의 타입으로 대체되는 Placeholder의 개념이다. [참고링크](https://babbab2.tistory.com/136)
- LinkedList는 노드를 가지고 있고 head 와 tail이 있다.
- ```isEmpty``` 읽기전용 프로퍼티를 선언하여 만약 노드가 없는 경우라면 head도 nil로 반환하여 아무것도 없는 것을 구현한다.

## Push
> 기존 Head 가 있는 위치에 새로운 값을 넣어주어 Head를 밀어내고 새로운 값을 Head로 변경해줌


```swift
    mutating func push(_ value: Value) {
        
        self.head = Node(value: value, next: head) 
        if tail == nil {
            tail = head
        }
    }
```
- Node를 관리하는 LinkedList를 struct 이므로 ```mutating func```를 이용하여 값을 변경해준다.
- head가 head.next로 가게되고 새로운 head가 생기도록 구현

**고려할 사항**
- tail이 nil 인 경우 비어있는 LinkedList 이기 때문에 self.head가 tail이자 head로 1개의 노드만 있는 형태로 구현한다.

## Append
> tail 위치에 새로운 tail을 추가해줌

```swift
    mutating func append(_ value: Value) {

        guard !self.isEmpty else {
            push(value)
            return
        }

        let node = Node(value: value)
        self.tail?.next = node // tail의 next에 node를 만들어주고 새로운 tail을 만들어준다.
        tail = node
    }
```
- 새로 넣어줄 node를 상수로 선언해준다.
- 원래 있던 LinkedList (self) 의 tail의 next 에 새로 넣어줄 node를 넣어준다.
- 그 node에 tail을 부여한다.

**고려할 사항**
- 값이 없는 경우 : push를 실행하여 tail, head를 동시에 갖도록 만들어준다.

## Insert
> 원하는 위치에 새로운 값을 삽입

```swift
// 특정 위치의 node를 찾아내는 메소드
    func node(at index: Int) -> Node<Value>? {

        var currentIndex = 0
        var currentNode = head

        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }

        return currentNode
    }
```
- 현재 인덱스가 0 이고, 현재 노드가 head 라는 기본값을 정한다.
- 현재 노드가 있고, 현재 인덱스(0)가 찾고자 하는 위치(index)보다 작으면 while문이 반복된다.
- 현재노드는 현재노드의 옆으로 이동하고, 인덱스에 1을 더해준다.
- 이런식으로 원하는 위치를 확인한다.
- 확인해서 while 조건을 성립하지 않으면 현재 노드를 반환한다.

```swift
    func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }
```
- 원하는 위치를 찾아서 그 노드 옆에 노드를 insert 해준다.

```swift
//출력
let middleNode = list.node(at: 1)!
list.insert(999, after: middleNode)
print(list)
```

## Pop
> head를 제거하고 그 옆의 값에게 head를 옮겨준다.

```swift
  mutating func pop() -> Value? {

        defer { 
            self.head = self.head?.next
            if isEmpty {
                tail = nil
            }
        }

        return head?.value
    }
```
- 먼저 return이 실행되어 head의 값이 있는지 확인해준다.
- head의 값이 반환되면 그 head를 head.next로 옮겨준다.
- 만약 노드가 한개밖에 없어서 그 한개를 반환하고 그 head를 head.next로 옮겨주려고 할때 비어있다면 tail을 nil 값으로 할당한다.


### defer란? 
> 함수가 종료되기 직전에 실행되는 구문, 마지막에 실행되는 구문

- defer를 읽기전 함수가 종료되면 (return 등으로) defer는 실행되지 않는다.
- 여러번의 defer를 호출할 수 있으며 가장 마지막에 호출되는 defer문 부터 역순으로 호출된다.

[참고링크](https://babbab2.tistory.com/80)

## Remove Last
> tail을 없애고 tail 앞의 노드에 tail을 옮겨준다.

```swift
  mutating func removeLast() -> Value? {
        // 노드가 없다면 nil
        guard let head = self.head else {
            return nil
        }
        // head 옆이 nil이라면 (아무것도 없다면) head 삭제하는 pop
        guard head.next != nil else {
            return pop()
        }

        var previous = head // 임의로 지정해준 값
        var current = head // 임의로 지정해준 값

        while let next = current.next { //10의 next 1
            previous = current // 10이 previous가 되고
            current = next // 1이 next
        } // 위와같이 계속 돌다가 next가 nil 이면 current인 3으로 값이 빠져나옴 (while문을 돌지 않고)

        previous.next = nil // 3 = nil 
        self.tail = previous // 1이 tail
        return current.value // 출력문에서 확인차 return 해주는 것
    }
```
- 만약 head가 없으면 nil 반환
- head는 있지만 head.next 가 없으면 현재 head를 반환하는 pop을 실행
- while문으로 tail의 위치와 tail 이전 node를 확인
- tail 이전 previous의 다음은 nil로 바꿔주고 tail은 이전의 값으로 옮겨주고 현재의 노드를 반환하여 tail을 지워서 이전의 값에 tail을 옮겨준다.

## Remove After
> 원하는 값의 next 값을 지운다.

```swift
    mutating func remove(after node: Node<Value>) -> Value? {

        defer {
            if node.next === tail {
                tail = node
            }

            node.next = node.next?.next
        }
        return node.next?.value // 출력문에서 확인차 return 값 입력
    }

```
**10(head) -> 1 -> 3(tail) -> nil**

- 10의 next인 1을 지운다고 가정한다.
- 우선 10의 next인 1이 존재하므로 1을 반환한다. (큰 의미 없음)
- 10의 next가 tail 이라면 tail은 node가 된다. 
- 10의 next가 tail이 아니므로 10의 next가 next?.next이니깐 3이된다. 
- 10 -> 1(제거) -> 3 -> nil 이된다.
- [=== 참고링크](https://ios-development.tistory.com/393)
