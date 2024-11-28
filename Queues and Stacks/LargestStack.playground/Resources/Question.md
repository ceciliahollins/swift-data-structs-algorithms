# Largest Stack
Source: [Interview Cake](https://www.interviewcake.com/question/swift/largest-stack?course=fc1&section=queues-stacks)

## You want to be able to access the largest element in a stack.

You've already implemented this Stack class:
```swift
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
```

Use your Stack class to **implement a new class with a method getMax() that returns the largest element in the stack.** getMax() should not remove the item. Push and pop methods should also be implemented to support getMax.

Your stacks will contain only integers.

Your skeleton class is as outlined below:

```swift
class Solution {

    // implement the push, pop, and getMax methods
    

    func push(_ item: Int) {

    }

    func pop() -> Int? {
        return nil
    }

    func getMax() -> Int? {
        return nil
    }
}
```
