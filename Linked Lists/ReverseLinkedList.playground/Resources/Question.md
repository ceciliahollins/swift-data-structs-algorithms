# Reverse a Linked List
Source: [Interview Cake](https://www.interviewcake.com/question/swift/reverse-linked-list?course=fc1&section=linked-lists)

## Hooray! It's opposite day. Linked lists go the opposite way today.

Write a function for reversing a linked list. Do it in place.

Your function will have one input: the head of the list.

Your function should return the new head of the list.

Here's a sample linked list node class:
```swift
class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}
```
