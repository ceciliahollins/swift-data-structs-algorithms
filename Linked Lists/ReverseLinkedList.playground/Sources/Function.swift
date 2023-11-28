
struct Solution {
    func reverseLinkedList<Value>(startingFrom headOfList: LinkedListNode<Value>?) -> LinkedListNode<Value>? {
        
        // create a variable holding the current head of list
        var curr = headOfList
        // create a variable to hold the node before the current variable
        var past: LinkedListNode<Value>? = nil
        
        // iterate the list
        while curr != nil {
            // hold the value of the next node in the list
            let next = curr?.next
            // update the next node of the current node to be the past node
            curr?.next = past
            // move the past and current nodes up the list
            past = curr
            curr = next
        }
        
        return past
    }
}

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
