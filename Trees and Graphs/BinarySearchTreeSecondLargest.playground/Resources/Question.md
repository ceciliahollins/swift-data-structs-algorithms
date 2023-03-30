# Second Largest Item in Binary Search Tree
Source: [Interview Cake](https://www.interviewcake.com/question/swift/second-largest-item-in-bst?course=fc1&section=trees-graphs)

## Write a function to find the 2nd largest element in a binary search tree.

Here's a sample binary tree node class:
```swift
class BinaryTreeNode {

    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    init(_ value: Int) {
        self.value = value
    }

    func insert(leftValue: Int) -> BinaryTreeNode {
        left = BinaryTreeNode(leftValue)
        return left!
    }

    func insert(rightValue: Int) -> BinaryTreeNode {
        right = BinaryTreeNode(rightValue)
        return right!
    }
}
```
