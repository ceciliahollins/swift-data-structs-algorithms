import XCTest

public class Tests: XCTestCase {

    func testFullTree() {
        let treeRoot = BinaryTreeNode(5)
        let leftNode = treeRoot.insert(leftValue: 8)
        leftNode.insert(leftValue: 1)
        leftNode.insert(rightValue: 2)
        let rightNode = treeRoot.insert(rightValue: 6)
        rightNode.insert(leftValue: 3)
        rightNode.insert(rightValue: 4)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testBothLeavesAtTheSameDepth() {
        let treeRoot = BinaryTreeNode(3)
        let leftNode = treeRoot.insert(leftValue: 4)
        leftNode.insert(leftValue: 1)
        let rightNode = treeRoot.insert(rightValue: 2)
        rightNode.insert(rightValue: 9)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testLeafHeightsDifferByOne() {
        let treeRoot = BinaryTreeNode(6)
        treeRoot.insert(leftValue: 1)
        let rightNode = treeRoot.insert(rightValue: 0)
        rightNode.insert(rightValue: 7)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testLeafHeightsDifferByTwo() {
        let treeRoot = BinaryTreeNode(6)
        treeRoot.insert(leftValue: 1)
        let rightNode = treeRoot.insert(rightValue: 0)
        rightNode.insert(rightValue: 7).insert(rightValue: 8)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertFalse(result)
    }

    func testThreeLeavesTotal() {
        let treeRoot = BinaryTreeNode(1)
        treeRoot.insert(leftValue: 5)
        let rightNode = treeRoot.insert(rightValue: 9)
        rightNode.insert(leftValue: 8)
        rightNode.insert(rightValue: 5)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testBothSubtreesSuperBalanced() {
        let treeRoot = BinaryTreeNode(1)
        treeRoot.insert(leftValue: 5)
        let rightNode = treeRoot.insert(rightValue: 9)
        rightNode.insert(leftValue: 8).insert(leftValue: 7)
        rightNode.insert(rightValue: 5)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertFalse(result)
    }

    func testBothSubtreesSuperBalancedTwo() {
        let treeRoot = BinaryTreeNode(1)
        let leftNode = treeRoot.insert(leftValue: 2)
        leftNode.insert(leftValue: 3)
        leftNode.insert(rightValue: 7).insert(rightValue: 8)
        let rightNode = treeRoot.insert(rightValue: 4)
        rightNode.insert(rightValue: 5).insert(rightValue: 6).insert(rightValue: 9)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertFalse(result)
    }

    func testThreeLeavesAtDifferentLevels() {
        let treeRoot = BinaryTreeNode(1)
        let leftNode = treeRoot.insert(leftValue: 2)
        let leftLeft = leftNode.insert(leftValue: 3)
        leftNode.insert(rightValue: 4)
        leftLeft.insert(leftValue: 5)
        leftLeft.insert(rightValue: 6)
        treeRoot.insert(rightValue: 7).insert(rightValue: 8).insert(rightValue: 9).insert(rightValue: 10)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertFalse(result)
    }

    func testOnlyOneNode() {
        let treeRoot = BinaryTreeNode(1)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testLinkedListTree() {
        let treeRoot = BinaryTreeNode(1)
        treeRoot.insert(rightValue: 2).insert(rightValue: 3).insert(rightValue: 4)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }
}

