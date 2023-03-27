class LinkedListNode<Value: Equatable>: Equatable {
    static func == (lhs: LinkedListNode<Value>, rhs: LinkedListNode<Value>) -> Bool {
        return lhs.value == rhs.value
        && lhs.next == rhs.next
    }
    
    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
}

func reverseLinkedList<Value>(startingFrom headOfList: LinkedListNode<Value>?) -> LinkedListNode<Value>? {

    guard var headOfList = headOfList else { return nil }
    guard let nextInList = headOfList.next else { return headOfList }
    
    var last: LinkedListNode<Value>? = nil
    var curr: LinkedListNode<Value>? = headOfList
    var next: LinkedListNode<Value>? = nextInList
    
    while curr != nil {
        headOfList = curr!
        headOfList.next = last
        
        let temp = next
        last = curr
        curr = next
        next = temp?.next
    }
    
    return headOfList
}
