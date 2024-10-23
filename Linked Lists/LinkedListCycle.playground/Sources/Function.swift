import Foundation

struct Solution {
    
    func containsCycle<T>(firstNode: LinkedListNode<T>) -> Bool {
        
        // start both pointers at the beginning
        var slowPointer = firstNode
        var fastPointer = firstNode
        
        // move the pointers to their next node if the node is there
        while let nextSlowPointer = slowPointer.next,
              let nextFastPointer = fastPointer.next?.next {
            // update the pointers
            slowPointer = nextSlowPointer
            fastPointer = nextFastPointer
            
            // if the fast and slow pointers are the same, the fast pointer has lapped the slow pointer and there is a cycle
            if fastPointer === slowPointer {
                return true
            }
        }
        
        // there was no next node for a runner to go, there is no cycle
        return false
    }
}

class LinkedListNode<Value: Equatable> {
    
    var value: Value
    var next: LinkedListNode?
    
    init(_ value: Value) {
        self.value = value
    }
}

