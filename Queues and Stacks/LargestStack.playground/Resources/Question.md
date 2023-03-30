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

Use your Stack class to **implement a new class MaxStack with a method getMax() that returns the largest element in the stack.** getMax() should not remove the item.

Your stacks will contain only integers.
