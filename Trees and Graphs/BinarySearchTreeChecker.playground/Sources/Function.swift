
struct Solution {
    
    func isBinarySearchTree(_ tree: BinaryTreeNode, _ roots: [Int: Side] = [:]) -> Bool {
            
        // check roots to ensure the current tree node is placed correctly
        if !roots.isEmpty {
            for (value, side) in roots {
                switch side {
                case .left:
                    if tree.value > value {
                        return false
                    }
                case .right:
                    if tree.value < value {
                        return false
                    }
                }
            }
        }
        
        // check child nodes
        if let left = tree.left {
            var newRoots = roots
            newRoots[tree.value] = .left
            if !isBinarySearchTree(left, newRoots) { return false }
        }
        
        if let right = tree.right {
            var newRoots = roots
            newRoots[tree.value] = .right
            if !isBinarySearchTree(right, newRoots) { return false }
        }

        return true
    }
}

class BinaryTreeNode {
    
    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
    
    @discardableResult
    func insert(leftValue: Int) -> BinaryTreeNode {
        let leftNode = BinaryTreeNode(leftValue)
        self.left = leftNode
        return leftNode
    }
    
    @discardableResult
    func insert(rightValue: Int) -> BinaryTreeNode {
        let rightNode = BinaryTreeNode(rightValue)
        self.right = rightNode
        return rightNode
    }
}

enum Side {
    case left
    case right
}
