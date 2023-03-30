
struct Solution {
    func isBalanced(treeRoot: BinaryTreeNode) -> Bool {
        
        guard treeRoot.left != nil && treeRoot.right != nil else {
            return true
        }
        
        let rootDeepestLevel = treeRoot.deepestLevel() - 1
        if rootDeepestLevel - 1 <= 1 {
            return true
        }
        
        return false
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
        let left = BinaryTreeNode(leftValue)
        self.left = left
        return left
    }

    @discardableResult
    func insert(rightValue: Int) -> BinaryTreeNode {
        let right = BinaryTreeNode(rightValue)
        self.right = right
        return right
    }
    
    func deepestLevel() -> Int {
        var leftLevel = 0
        var rightLevel = 0
        
        if let left = self.left { leftLevel = left.deepestLevel() }
        if let right = self.right { rightLevel = right.deepestLevel() }
        
        return max(leftLevel, rightLevel) + 1
    }
}
