
struct Solution {
    func kthToLastNode(at k: Int, forHead head: LinkedListNode<Int>) throws -> LinkedListNode<Int> {
        
        // create a node variable to track the iteration of the linked list
        var currNode: LinkedListNode = head
        // create a node variable to track the kth node behind the currNode
        var kthNode: LinkedListNode = head

        // create a variable to count the length of the linked list while iterating
        var i = 0
        // continue to iterate the linked list while there is still a next node
        while let next = currNode.next {
            // increase the count of i
            i += 1
            // advance the currNode
            currNode = next
            
            // if the current node count is greater than or the same as k, the kthNode behind the currNode has been found
            // currNode should pull the kthNode to its next node
            if i >= k {
                kthNode = kthNode.next!
            }
        }
        
        // ensure k is not larger than the length of the linked list or less then 0
        guard k < i && k > 0 else {
            throw LinkedListError.kMoreThanListLength
        }
        
        // return the kthNode
        return kthNode
    }
}

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
