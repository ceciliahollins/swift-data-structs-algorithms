public class ChangePossibilities {
    
    // create a new tree with 0 as the root
    let possibilityTree = CoinTree(head: 0)
        
    func changePossibilities(amount: Int, denominations: [Int]) -> Int {
        guard amount > 0 else { return 1 }
        
        // start with the largest coins first
        let sortedDenominations = denominations.sorted(by: { $1 < $0 })
        
        // start the tree by adding each denomination onto the tree
        for (i, denomination) in sortedDenominations.enumerated() {
            // create a new tree with curr denomination as the head
            let coin = CoinTree(head: denomination)
            possibilityTree.addNode(node: coin, denominations: Array(sortedDenominations[i...]), totalAmount: amount, branchAmount: possibilityTree.head)
        }

        return possibilityTree.getCount()
    }
}

// An implementation of a tree to add coin values into
class CoinTree {
    var head: Int
    var nodes: [CoinTree] = []
        
    init(head: Int) {
        self.head = head
    }
    
    func addNode(node: CoinTree, denominations: [Int], totalAmount: Int, branchAmount: Int) {
        
        // if the current branch amount plus the new node amount will be less than or equal to the total amount, the node can be added
        if branchAmount + node.head <= totalAmount {
            self.nodes.append(node)
            
            // test the other denominations to see if they can also be added onto the tree
            for denomination in denominations {
                
                // create the potential new node
                let nodeToAdd = CoinTree(head: denomination)
                
                // denominations will be the same or smaller amount as the current denomination as the tree goes down
                let filteredDenominations = denominations.filter({ $0 <= denomination})
                
                // update the current branch amount
                let branchAmount = branchAmount + node.head
                
                // recursively add the new node to the tree
                node.addNode(node: nodeToAdd,
                             denominations: filteredDenominations,
                             totalAmount: totalAmount,
                             branchAmount: branchAmount)
            }
        }
    }
    
    func getCount() -> Int {
        var count: Int = 0
        
        for child in self.nodes {
            if child.isEndOfBranch() {
                count += 1
            } else {
                count += child.getCount()
            }
        }
        return count
    }
    
    func isEndOfBranch() -> Bool {
        return self.nodes.isEmpty
    }
}


