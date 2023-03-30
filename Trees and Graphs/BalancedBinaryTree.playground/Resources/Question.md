# Balanced Binary Tree
Source: [Interview Cake](https://www.interviewcake.com/question/swift/balanced-binary-tree?course=fc1&section=trees-graphs)

## Write a function to see if a binary tree is "superbalanced" (a new tree property we just made up).

A tree is "superbalanced" if the difference between the depths of any two leaf nodes ↴ is no greater than one.

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
