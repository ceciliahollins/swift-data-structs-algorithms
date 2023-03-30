import Foundation

class Solution {
    
    var items: [Int] = []
    var maxItems: Stack<Int> = Stack()
    
    func push(_ item: Int) {
        
        if let maxItem = maxItems.peek() {
            if item >= maxItem {
                maxItems.push(item)
            }
        } else {
            maxItems.push(item)
        }
        
        items.append(item)
    }
    
    func pop() -> Int? {
        guard !items.isEmpty else { return nil }
        
        if items.last == maxItems.peek() {
            let _ = maxItems.pop()
        }
        
        return items.removeLast()
    }
    
    func getMax() -> Int? {
        return maxItems.peek()
    }
}

class Stack<Item> {
    
    // initialize an empty array to hold our stack items
    var items: [Item] = []
    
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
