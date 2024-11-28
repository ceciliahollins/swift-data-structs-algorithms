## Implement a tuple stack
### time complexity: O(1)
### space complexity: O(n)

Our Stack class that was provided uses generics to allow flexibility for what our data type is. Because of this, we can **take advantage of creating a slightly more complex stack than just a stack that holds integers.**

The general idea is we keep track of current max values as we add new items to the stack. By creating pairs of integers, we can use one int to add the actual value and the other to hold what it knows the current max value to be. As items are added to the stack, the new item should peek at the last item to see what the last item knows the current max to be. If the new value is smaller than that current max value, it knows the current max item at that point in the stack is that current max value. If the new value is larger, it knows there is a new max value and adds itself as its known max value. The last item, however, does not change its value as at their position in the stack still holds true for the current max.

For example:

```swift
let solution = Solution()

// push the first item on the stack
solution.push(2)
// in the Solution class, the push method decides if 2 is the current max of the stack
// there are no other values, so it adds 2 in the tuple as the max
// solution.stack pushes (val: 2, max: 2)
// solution.stack.items is now [(2, 2)]

// call getMax method to see the max value
// getMax peeks at the last item, and returns what it knows the current max to be
solution.getMax() // -> returns 2

// push another item on the stack
solution.push(1)
// the push method will investigate what the last item knows the max to be
// the item 2 knows that the max value at its spot in the stack is 2
// push method decides if the new max will be 2 (the max value from the last item), or 1 (the current item)
// solution.stack pushes (val: 1, max: 2)
// solution.stack.items is now [(2, 2), (1, 2)]

// call getMax method to see the max value
solution.getMax() // -> returns 2

// push another item on the stack
solution.push(3)
// the push method will investigate what the last item knows the max to be
// the item 1 knows that the max value at its spot in the stack is 2
// push method decides if the new max will be 2 (the max value from the last item), or 3 (the current item)
// solution.stack pushes (val: 3, max: 3)
// solution.stack.items is now [(2, 2), (1, 2), (3, 3)]

// call getMax method to see the max value
solution.getMax() // -> returns 3
```

It is important to note that when pushing new items, the max values of the other items do not change. As items are removed from the stack, the max value might change. **Because stacks remove items LIFO, what an item knows to be the max value at its position in the stack will not change.** As items are removed, the max value will always still be correct, keeping the time complexity at O(1).

This can be understood as we pop items from the stack

```swift
//

// pop from the stack
solution.pop()
// solution.stack removes (val: 3, max: 3)
// solution.stack.items is now [(2, 2), (1, 2)]
// the max item in the stack is no longer 3 since it was removed

// call getMax method to see the max value
solution.getMax() // -> returns 2
// the new max item is 2, which was held in the tuple the the value 1
```

If we continue popping from the stack, the max value held in the tuples continue to be true because of the nature of the Stack class.

When the max value is held with each addition of a new value, the time complexity can be constant at O(1). The LIFO characteristic of the Stack class is used to keep the time constant for getting max values. By taking advantage of the generic item in the Stack class, the tuple implementation allows space complexity to be linear at O(n). This cannot be decreased, as the numbers added to the stack needs to be held.

## Create two stacks, one for holding data and one for holding the current max
### time complexity: O(1)
### space complexity: O(n)

This solution is very similar to the solution above, where the general jist is holding the current max value for the value being added as you add items to the stack. However, this solution would be used if the Stack class only accepts Integer items to be inserted (i.e. in the LeetCode equivalent of this problem). It is also just a similar alternative to the solution above. 

The difference in this solution is that there are two seperate stacks created, instead of holding tuple pairs in one stack. It would look something like this:
```swift
var valueStack = Stack()
var maxStack = Stack

func push(_ item: Int) {
    var newMax = item
    if let currMax = maxStack.peek() {
        newMax = max(newMax, currMax)
    }
    
    valueStack.push(item)
    maxStack.push(newMax)
}

func pop() -> Int? {
    let _ = maxStack.pop()
    return valueStack.pop()
}

func getMax() -> Int? {
    return maxStack.peek()
}
```

The time complexity for this algorithm is constant O(1), since the current max is being held as items are added. This ensure only a peek is needed to get the max value. The space complexity is O(2n), or O(n), as two stacks the size of the input are being held.

While this solution is quite similar to above solution, it is probably not preferred as there are two stack to keep track of. Every push and pop needs to make sure it is doing the action to both stacks. If there is a mistake in these actions, the stack will no longer be synced and the max value could be incorrect. The above solution is able to confirm synced values because of the pair in a tuple in one stack.

## Create a variable to hold the current max and search stack for new max when removed
### time complexity: O(n)
### space complexity: O(1)

Another possible solution would be to hold only a single variable of what the current max value is known to be, rather than holding a max value for every value inserted into the stack. This implementation might look as followed:

```swift
var stack = Stack<Int>()
var maxValue: Int? = nil

func push(_ item: Int) {
    if let item > maxValue {
        maxValue = item
    }
    stack.push(item)
}

func pop() -> Int? {
    let poppedVal = stack.pop()
    if poppedVal == maxValue {
        // implement a method to search the entire stack and find the new max value
    }
    return poppedVal
}

func getMax() -> Int? {
    return maxValue
}
```

While this solution is generally quite simple, a new method needs to be implemented when the current max item is being removed from the stack. This increases our worst case time complexity to O(n) for popping a value, which is not ideal. It does however, bring the space complexity down to O(1) excluding the space of the stack. The above solutions are preferred because of the O(1) time complexity for all methods. This solution would also go against the nature of what a stack does by implementing more than just peeking at the top item but searching the whole stack. 

## Brute force - seach the entire stack every time for the max
### time complexity: O(n)
### space complexity: O(1)

This solution is brute force and searches the stack every time for the max value. Not only does this go against the general nature of only peeking the top item of a stack, but it requires O(n) time for every getMax call. Because of this, it is not recommended to implement this solution.
