import Foundation

class Solution {
    
    var stack: Stack<(val: Int, max: Int)> = Stack()
    
    func push(_ item: Int) {
        var newMax = item
        if let currMax = stack.peek()?.max {
            newMax = max(newMax, currMax)
        }
        
        stack.push((item, newMax))
    }
    
    func pop() -> Int? {
        return stack.pop()?.val
    }
    
    func getMax() -> Int? {
        return stack.peek()?.max
    }
}

class Stack<Item> {
    
    // initialize an empty array to hold our stack items
    private var items: [Item] = []
    
    // push a new item onto the stack
    func push(_ item: Item) {
        items.append(item)
    }
    
    // remove and return the last item
    func pop() -> Item? {
        
        // if the stack is empty, return nil
        // (it would also be reasonable to throw an exception)
        if items.count == 0 {
            return nil
        }
        return items.removeLast()
    }
    
    // return the last item without removing it
    func peek() -> Item? {
        return items.last
    }
}
