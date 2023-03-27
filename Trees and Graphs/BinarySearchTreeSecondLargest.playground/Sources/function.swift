public class BinaryTreeNode {

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
}

func findSecondLargestValue(startingFrom node: BinaryTreeNode) throws -> Int {
    
    var largest = [0, 0]
    largest = findTwoLargest(startingFrom: node, twoLargest: largest)
    
    print("Final", largest)
    return largest[0]
}

func findTwoLargest(startingFrom node: BinaryTreeNode, twoLargest: [Int]) -> [Int] {
    
    var largest = twoLargest
    print("starting", node.value, node.left?.value, node.right?.value)
    
    if let right = node.right {
        largest[0] = max(node.value, largest[0])
        largest[1] = max(right.value, largest[1])
        largest = findTwoLargest(startingFrom: right, twoLargest: largest)
    } else if let left = node.left {
        largest[0] = max(left.value, largest[0])
        largest[1] = max(node.value, largest[1])
        largest = findTwoLargest(startingFrom: left, twoLargest: largest)
    }
    
    print("returning", twoLargest)
    return largest
}
