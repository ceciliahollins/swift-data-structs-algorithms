import Foundation

struct Solution {
    
    func containsCycle<T>(firstNode: LinkedListNode<T>) -> Bool {
        
        // start both runners at the beginning
        var slowRunner = firstNode
        var fastRunner = firstNode
        
        // until we hit the end of the list
        while let nextSlowRunner = slowRunner.next,
              let nextFastRunner = fastRunner.next?.next {
            slowRunner = nextSlowRunner
            fastRunner = nextFastRunner
            
            // case: fastRunner is about to "lap" slowRunner
            if fastRunner === slowRunner {
                return true
            }
        }
        
        // case: fastRunner hit the end of the list
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

