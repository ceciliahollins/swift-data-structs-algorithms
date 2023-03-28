import XCTest

public class Tests: XCTestCase {
    
    func testFullTree() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)
        let right = root.insert(rightValue: 70)
        right.insert(leftValue: 60)
        right.insert(rightValue: 80)

        let actual = try? Solution().findSecondLargestValue(startingFrom: root)
        let expected = 70
        XCTAssertEqual(actual, expected)
    }

    func testLargestHasALeftChild() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)
        let right = root.insert(rightValue: 70)
        right.insert(leftValue: 60)

        let actual = try? Solution().findSecondLargestValue(startingFrom: root)
        let expected = 60
        XCTAssertEqual(actual, expected)
    }

    func testLargestHasALeftSubtree() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)
        let right = root.insert(rightValue: 70)
        let rightLeft = right.insert(leftValue: 60)
        rightLeft.insert(leftValue: 55).insert(rightValue: 58)
        rightLeft.insert(rightValue: 65)

        let actual = try? Solution().findSecondLargestValue(startingFrom: root)
        let expected = 65
        XCTAssertEqual(actual, expected)
    }

    func testSecondLargestIsRootNode() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)
        root.insert(rightValue: 70)

        let actual = try? Solution().findSecondLargestValue(startingFrom: root)
        let expected = 50
        XCTAssertEqual(actual, expected)
    }

    func testTwoNodesRootIsLargest() {
        let root = BinaryTreeNode(50)
        root.insert(leftValue: 30)

        let actual = try? Solution().findSecondLargestValue(startingFrom: root)
        let expected = 30
        XCTAssertEqual(actual, expected)
    }

    func testSecondLargestRightOffshootLeft() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)

        let actual = try? Solution().findSecondLargestValue(startingFrom: root)
        let expected = 40
        XCTAssertEqual(actual, expected)
    }
    
    func testDescendingLinkedList() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 40)
        left.insert(leftValue: 30).insert(leftValue: 20).insert(leftValue: 10)
        
        let actual = try? Solution().findSecondLargestValue(startingFrom: root)
        let expected = 40
        XCTAssertEqual(actual, expected)
    }
    
    func testAscendingLinkedList() {
        let root = BinaryTreeNode(50)
        let right = root.insert(rightValue: 60)
        right.insert(rightValue: 70).insert(rightValue: 80)

        let actual = try? Solution().findSecondLargestValue(startingFrom: root)
        let expected = 70
        XCTAssertEqual(actual, expected)
    }

    func testThrowsErrorWhenTreeHasOneNode() {
        let root = BinaryTreeNode(50)

        let result = try? Solution().findSecondLargestValue(startingFrom: root)
        XCTAssertNil(result)
    }
}

