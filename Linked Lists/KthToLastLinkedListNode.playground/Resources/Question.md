# Kth to the Last in Singly Linked List
Source: [Interview Cake](https://www.interviewcake.com/question/swift/kth-to-last-node-in-singly-linked-list?course=fc1&section=linked-lists)

## You have a linked list and want to find the kth to last node.

Write a function kthToLastNode() that takes an integer k and the headNode of a singly-linked list, and returns the kth to last node in the list.

For example:
```swift
class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
 }

let a = LinkedListNode(1)
let b = LinkedListNode(2)
let c = LinkedListNode(3)
let d = LinkedListNode(4)
let e = LinkedListNode(5)

a.next = b
b.next = c
c.next = d
d.next = e

// returns the node with value 4 (the 2nd to last node)
var node = kthToLastNode(at: 2, forHead: a)
```
