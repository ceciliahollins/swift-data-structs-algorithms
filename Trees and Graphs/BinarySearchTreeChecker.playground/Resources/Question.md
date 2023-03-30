# Binary Search Tree Checker
Source: [Interview Cake](https://www.interviewcake.com/question/swift/bst-checker?course=fc1&section=trees-graphs)

## Write a function to check that a binary tree is a valid binary search tree.

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
        let left = BinaryTreeNode(leftValue)
        self.left = left
        return left
    }

    func insert(rightValue: Int) -> BinaryTreeNode {
        let right = BinaryTreeNode(rightValue)
        self.right = right
        return right
    }
}
```
