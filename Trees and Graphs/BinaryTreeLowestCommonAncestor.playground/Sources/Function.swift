
class Solution {

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // base case - root is nil
        // unwrap optional values for use
        guard let root = root,
            let p = p,
            let q = q else { return nil }

        // if the current root node is p or q, return the root
        if root.val == p.val || root.val ==  q.val {
            return root
        }

        // recursively check the left and right children for p and q
        let leftChildNode = lowestCommonAncestor(root.left, p, q)
        let rightChildNode = lowestCommonAncestor(root.right, p, q)

        if (leftChildNode != nil && rightChildNode != nil) {
            
            // if the left child and the right child returned nodes, the root is the lca
            return root
            
        } else if leftChildNode != nil && rightChildNode == nil {
            
            // if the left child returned a node but the right node did not, return the left child node
            return leftChildNode
            
        } else if leftChildNode == nil && rightChildNode != nil {
            
            // if the right child returned a node but the right node did not, return the right child node
            return rightChildNode
        }

        // if the left or right child did not return a node, return nil
        return nil
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    func insert(left: TreeNode) {
        self.left = left
    }

    func insert(right: TreeNode) {
        self.right = right
    }
}
