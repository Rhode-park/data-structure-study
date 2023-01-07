# Linked List
> 참고문서  
> - [CustomStringConvertible](https://developer.apple.com/documentation/swift/customstringconvertible)  
> - [“===“ 연산자](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#ID90)  
> - [Generic Type](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)  

* Linked List는 값과 이전 혹은 다음 또는 둘다의 위치를 가지고 있다.
* Node는 값과 위치를 가지고 있는 하나의 객체를 말한다.
* Linked List는 이러한 Node가 연결되어 있는 것을 의미한다.

### 위치 및 값을 가지고 있는 Node구현
```swift
class Node<T> {
    var value: T	// 값을 가지는 프로퍼티
    var next: Node? // 위치를 가지는 프로퍼티 옵셔널인 이유는 LinkedList 맨 뒤의 Node는 항상 nil을 가리키고 있기 때문이다.
    
    init(value: T, next: Node? = nil) {
		  // 기본적인 이니셜라이저로 Node는 기본값으로 nil을 부여해준다.
        self.value = value
        self.next = next
    }
}
```

* 위 클래스 Node가 기본적인 구현이 완성된 코드이며, 이것을 조금 더 보기 쉽게 표현해주기 위하여 CustomStringConvertible 프로토콜을 채택하여 print할 시 편하게 볼 수 있도록 제공한다.

```swift
extension Node: CustomStringConvertible {
	  // 
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}
```

* CustomStringConvertible 프로토콜을 채택한다면, description이라는 읽기전용 프로퍼티를 항상 선언해줘야 하며 description의 내용이 해당 타입을 원하는 형태로 print해줄 수 있다.

```swift
let node1 = Node(value: 1)
let node2 = Node(value: 2)

node1.next = node2

print(node1)	// print 1 -> 2
```

* 위 구문을 출력할 시 Node클래스의 description에서 구현한 내용이 출력 되는 것을 볼 수 있다.

### LinkedList 구현
* LinkedList는 노드들을 가지고 있으며, 헤드(head)와 테일(tail)을 가지고 있어 각자의 순서를 가진다.

```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
}
```

### isEmpty 프로퍼티(읽기전용) 구현
```swift
struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
}
```
* 만약 LinkedList가 어떠한 Node도 가지고 있지 않다면 head가 nil이기 때문에 head가 nil 일 경우 비어있다라는 의미로 true를 리턴해준다.

### push 메소드 구현
```swift
mutating func push(_ value: T) {
    self.head = Node(value: value, next: head)
    if tail == nil {
        tail = head
    }
}
```
* push메소드는 head에 Node를 추가해주는 메소드이다.
* Node의 값과 현재 head에 있는 Node값을 next로 부여하여 Node를 만들어 현재 head값에 넣는다.
* 만약 tail값이 nil이라면 head값이 할당되기전에 비어있는 LinkedList였으므로, tail값에 현재 할당된 head값을 넣어준다.
* 이렇게 될 경우 현재 LinkedList는 하나의 Node만을 가지고 이 Node는 head이자 tail이다.

### append 메소드 구현
```swift
mutating func append(_ value: T) {
    guard !self.isEmpty else {
        push(value)
        return
    }
        
    let node = Node(value: value)
    self.tail?.next = node
    tail = node
}
```
* append는 꼬리에 Node를 넣어주는 함수이다.
* 만약 현재 LinkedList가 비어있다면 단순히 push를 해주고 끝이 난다.
* 반대로, LinkedList가 비어있지 않다면 이전 tail의 Node.next값을 새로 생성한 Node를 지정해주고 꼬리가 생성된 Node를 바라보게 만들어 줘야 한다.

### 특정 위치의 node를 검색하는 메소드 구현
```swift
func node(at index: Int) -> Node<T>? {
    var currentIndex = 0
    var currentNode = head
        
    while currentNode != nil && currentIndex < index {
        currentNode = currentNode?.next
        currentIndex += 1
    }
        
    return currentNode
}
```
* 이 함수는 insert혹은 remove와 같은 특정 위치의 Node를 확인하기 위해 사용된다.
* 특정 index위치의 node를 찾아주는 메소드이다. 이 경우 3개의 Node를 가진 LinkedList에 6번째 값을 요구할 수 있기 때문에 옵셔널 타입을 반환 값으로 가진다.
* currentIndex와 currentNode를 가진다.
* while문은 현재 Node가 nil인 상태(head부터 tail까지 끝까지 탐색한 상태), 혹은 현재 인덱스(currentIndex)가 index보다 같거나 커지면 동작을 멈춘다.
* while문의 반복이 끝난다면 currentNode != nil의 조건문으로 인해 멈추었다면 currentNode는 nil이 반환될 것이다.
* currentIndex < index의 조건이 충족하지 못해 멈추었다면 currentNode의 Node를 찾은거이며 해당 Node를 반환해 줄 것이다.

### 특정 위치에 Node를 넣는 insert메소드 구현
```swift
func insert(_ value: T, after node: Node<T>) {
    node.next = Node(value: value, next: node.next)
}
```
* 그림과 같이 특정 위치에 Node를 추가하기 위해서는 현재 위치하고 있는 Node의 next를 추가할 Node로 바꾸고 기존 Node가 참고하고 있던 next값을 추가 된 Node가 가지면 된다.

* 값을 넣기 전

![](https://raw.githubusercontent.com/Rhode-park/data-structure-study/leonFather/image/linkedList_beforeInsert.png)

* 값을 넣은 후 

![](https://raw.githubusercontent.com/Rhode-park/data-structure-study/leonFather/image/linkedList_afterInster.png)

### pop을 구현하기 전 defer란?
> [defer-swift document]( https://docs.swift.org/swift-book/ReferenceManual/Statements.html)  
* defer statement는 프로그램이 권한 밖 지역을 벗어나기 직전 실행 되는 상태구문이다.
```swift
func f() {
	  defer { print("First defer") }
	  defer { print("Second defer") }
    print("End of function")
}
f()
// Prints "End of function"
// Prints "Second defer"
// Prints "First defer"
```
* defer의 경우 스택 처럼 쌓여서 함수 구문이 끝나고 defer가 실행 될 때는 가장 밑에 있는 defer문 부터 작동이 된다.

### pop메소드 구현
```swift
mutating func pop() -> T? {
    defer {
        self.head = self.head?.next
        if isEmpty {
            tail = nil
        }
    }
        
    return head?.value
}
```
* pop메소드는 헤드에 위치한 Node를 제거하고, 해당 Node의 값을 반환해준다. 전부 비워있을 경우도 있기 때문에 옵셔널 타입으로 반환해준다.
* 우선 비워있을 수 있기 때문에 head?.value로 옵셔널체이닝을 하여 반환해주고 defer내의 구문(head의 연결을 끊어주는 역할)이 동작한다.
* 현재 head의 next를 head로 교체해준다. 그러나 원래 Node를 하나만 가지고 있는 경우 동작 이후 비워져있기 때문에 isEmpty로 확인하고 tail을 nil값으로 할당해준다.

### removeLast메소드 구현
* removeLast는 tail값을 제거해주는 메소드이다.
```swift
mutating func removeLast() -> T? {
    guard let head = self.head else {
        return nil
    }
        
    guard head.next != nil else {
        return self.pop()
    }
        
    var prev = head
    var current = head
        
    while let next = current.next {
        prev = current
        current = next

    }
        
    prev.next = nil
    self.tail = prev
        
    return current.value
}
```

* 만약 현재 head값이 없다면 비어져있다는 뜻이므로 nil을 반환해준다.
* head가 존재하나 head의 next가 nil을 가리키고 있다면 현재 head만 반환해주면 되기 때문에 이전 구현한 pop메소드를 사용한다.
* 이후 while문을 사용하여 tail의 위치와 tail이전 Node를 확인한다.
* tail이전 값 prev Node의 next를 nil로 할당하고 tail로 변화시켜주고, 현재 current에 들어있는 Node값을 반환해준다.

### remove메소드 구현
* 이전 구현했던 node메소드를 통해 몇번째 이후의 Node를 제거해준다.
```swift
mutating func remove(after node: Node<T>) -> T? {
    defer {
        if node.next === tail {
            tail = node
        }
            
        node.next = node.next?.next
    }
        
    return node.next?.value
}
```
* 우선 인자로 받은 Node의 next.value값을 반환해준다.
* 이후 defer구문이 동작한다. 만약 다음 node가 tail과 같은 node일 경우 tail에 node를 넣어준다.
* 마지막으로 node의 다음값을 이전 현재 node의 앞앞 next값을 넣어준다.(만약 현재 Node가 tail이라도 옵셔널 체이닝으로 node.next?부분에서 nil을 반환하기 때문에 문제없이 동작한다.)

![](https://raw.githubusercontent.com/Rhode-park/data-structure-study/leonFather/image/remove1.png)


![](https://raw.githubusercontent.com/Rhode-park/data-structure-study/leonFather/image/remove2.png)

### “===“연산자를 알아보자
> [Structures and Classes — The Swift Programming Language (Swift 5.7)](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#ID90)  

* Identity Operators라고 불린다. 클래스는 레퍼런스 타입이기 때문에 여러 상수와 변수들이 서로 다른 인스턴스가 있을 수 있기 때문에 이것이 같은 하나의 인스턴스인지 확인하는 연산자이다.
* 즉 두개의 상수 혹은 변수 인스턴스들 서로 같은 인스턴스인지 확인할 때 유용하다.
```swift
class Cat {
}

let leon = Cat()
let myCat = leon

let jiHunsCat = Cat()
let friendsCat = jiHunsCat

print(leon === myCat) //print true
print(leon === jiHunsCat) //print false
print(leon === friendsCat) //print false
print(jiHunsCat === friendsCat) //print true
```

* 즉 ===는 단순히 클래스 내의 변수, 상수와 같은 프로퍼티를 비교하는게 아닌 서로 같은 클래스의 인스턴스인지를 확인하는 연산자이다.