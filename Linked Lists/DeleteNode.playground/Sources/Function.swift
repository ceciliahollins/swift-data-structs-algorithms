import Foundation

struct Solution {
    
    func deleteNode<T>(_ nodeToDelete: LinkedListNode<T>) throws {

        guard let nextNode = nodeToDelete.next else { throw NodeError.lastNode }

        nodeToDelete.value = nextNode.value
        nodeToDelete.next = nextNode.next
        nextNode.next = nil
    }
}

class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode<Value>?

    init(_ value: Value, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

enum NodeError: Error {
        case lastNode
}

