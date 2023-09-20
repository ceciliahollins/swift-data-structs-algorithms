## Recursively search child nodes, return the lowest node that has p or q as children
### time complexity: O(n)
### space complexity: O(n)

A recursive DFS is used in this algorithm to search the child nodes to find p or q in the child list. The returned node results from both the left and right children are then used to assess the LCA. 

The algorithm starts with checking the base case- if the root is nil, nil is returned. The p and q nodes are also unwrapped, as these are passing in as optional values.
```swift
guard let root = root,
    let p = p,
    let q = q else { return nil }
```

If p or q is the current root node, the LCA cannot be any lower in the child nodes and the current root node should be returned. This condition should be checked before any recursive calls to avoid unnecessary time additions. 
```swift
if root.val == p.val || root.val ==  q.val {
    return root
}
```

The left and right child nodes should then be assessed for p and q nodes using recursion.
```swift 
let leftChildNode = lowestCommonAncestor(root.left, p, q)
let rightChildNode = lowestCommonAncestor(root.right, p, q)
```

Once these recursive calls have returned a result, these results can be assessed.

If the left child and the right child have both returned nodes, it is known that the current node is the LCA. Both children have p or q in their child list, meaning the current node is a common parent, and the LCA cannot be lower than the current node.
```swift
if (leftChildNode != nil && rightChildNode != nil) {
    return root
}
```

If the left child has returned a node but the right child has returned nil, p or q has been found in the left child and nothing was in the right child. The left child should be returned as a contendor for the LCA. Vice versa for the right child node.
```swift
else if leftChildNode != nil && rightChildNode == nil {
    return leftChildNode
} else if leftChildNode == nil && rightChildNode != nil {
    return rightChildNode
}
```
This node will be passed up to the parents, where it will be decided if it is the LCA based on the results from the other child. If all other child nodes return nil, this node is the LCA. If another child node returns a node, this node is not the LCA but it is known that either p or q was in that branch.

If neither the left or right child returned nodes, p or q is not in this branch and nil is returned.

The time complexity of this algorithm is O(n), as all nodes need to be searched for p and q. Space complexity is O(n) to account for the recursive call stack. While this is the same time and space complexity as the solution below, it is technically better when comparing the constants of time O(3n) vs O(n) and space O(4n) vs O(n). The time complexity cannot be improved farther, as all nodes will always need to be searched. However, this solution could be improved by attempting to get rid of the recursive call stack and bringing the space down to O(1).

## Find p and q in the tree, create an array of p and q's parents, and compare parent lists
### time complexity: O(n)
### space complexity: O(n)

For this algorithm, the first step is to DFS in the tree to find where p and q nodes are, and along the way create a list of parents. The parents will be stored in an array so the order of the parents are kept. This can be done with a helper function shown below.

```swift
func getParentsList(_ root: TreeNode, _ node: TreeNode, _ parents: [TreeNode]) -> [TreeNode] {

    var parents = parents
    parents.append(root)

    if root.val == node.val {
        return parents
    }

    if let left = root.left {
        let parents = getParentsList(left, node, parents)
        if !parents.isEmpty { return parents }
    }

    if let right = root.right {
        let parents = getParentsList(right, node, parents)
        if !parents.isEmpty { return parents }
    }

    return []
}
```

This helper funciton has a time complexity of O(n) as worse case is every node is searched to find the wanted node. Space complexity is also O(n) to account for the recursive call stack.

Once a parent list for both the p and q node are found, the arrays are compared. A while loop will start at the beginning of the parent array's and continue until either the values at that index do not match or one array is at the end of the parent list.

```swift
var i = 0
var lca = root
while i < pParents.count && i < qParents.count {
    if pParents[i].val == qParents[i].val {
        lca = pParents[i]
    }

    i += 1
}

return lca
```

This part of the algorithm has a time complexity of O(n), as worse case is all the nodes are on one parent branch and has ended up in the parents list, and the entire array needs to be searched. The space complexity is also O(n) to account for the array. 

With the combination of getting the parent lists for both p and q (O(2n) time and O(2n) space), and comparing the parent list (O(n) time and O(2n) space), the final time complexity is O(n) and final space is O(n), coming from O(3n) time and O(4n) space. While O(n) time and space is not a bad complexity, the algorithm could still be improved.
