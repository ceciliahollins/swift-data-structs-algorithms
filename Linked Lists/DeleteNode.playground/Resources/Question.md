# Delete Node
Source: [Interview Cake](https://www.interviewcake.com/question/swift/delete-node?course=fc1&section=linked-lists)

## Delete a node from a singly-linked list, given *only a variable pointing to that node.*

The input could, for example, be the variable b below:
```swift
class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}

let a = LinkedListNode("A")
let b = LinkedListNode("B")
let c = LinkedListNode("C")

a.next = b
b.next = c

try deleteNode(b)
```
