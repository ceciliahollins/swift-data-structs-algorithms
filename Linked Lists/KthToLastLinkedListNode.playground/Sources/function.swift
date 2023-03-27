class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}

enum LinkedListError: Error {
    case kMoreThanListLength
}

func kthToLastNode(at k: Int, forHead head: LinkedListNode<Int>) throws -> LinkedListNode<Int> {

    var lastNode: Int = 1
    var currNode = head
    while let nextNode = currNode.next {
        lastNode += 1
        currNode = nextNode
    }
    
    guard k <= lastNode && k > 0 else {
            throw LinkedListError.kMoreThanListLength
        }
    
    var i = lastNode - k
    var kNode = head
    while i >= 1 {
        guard let next = kNode.next else { break }
        kNode = next
        i -= 1
    }
    
    return kNode
}
