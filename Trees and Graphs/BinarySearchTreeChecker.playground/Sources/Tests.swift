import XCTest

public class Tests: XCTestCase {

    func testValidFullTree() {
            let root = BinaryTreeNode(50)
            let left = root.insert(leftValue: 30)
            left.insert(leftValue: 10)
            left.insert(rightValue: 40)
            let right = root.insert(rightValue: 70)
            right.insert(leftValue: 60)
            right.insert(rightValue: 80)

        let result = Solution().isBinarySearchTree(root)
            XCTAssertTrue(result)
        }

        func testBothSubtreesValid() {
            let root = BinaryTreeNode(50)
            let left = root.insert(leftValue: 30)
            left.insert(leftValue: 20)
            left.insert(rightValue: 60)
            let right = root.insert(rightValue: 80)
            right.insert(leftValue: 70)
            right.insert(rightValue: 90)

            let result = Solution().isBinarySearchTree(root)
            XCTAssertFalse(result)
        }

        func testDescendingLinkedList() {
            let root = BinaryTreeNode(50)
            let left = root.insert(leftValue: 40)
            let leftLeft = left.insert(leftValue: 30)
            let leftLeftLeft = leftLeft.insert(leftValue: 20)
            leftLeftLeft.insert(leftValue: 10)

            let result = Solution().isBinarySearchTree(root)
            XCTAssertTrue(result)
        }

        func testOutOfOrderLinkedList() {
            let root = BinaryTreeNode(50)
            let right = root.insert(leftValue: 70)
            let rightRight = right.insert(leftValue: 60)
            rightRight.insert(leftValue: 80)

            let result = Solution().isBinarySearchTree(root)
            XCTAssertFalse(result)
        }

        func testOneNodeTree() {
            let root = BinaryTreeNode(50)

            let result = Solution().isBinarySearchTree(root)
            XCTAssertTrue(result)
        }
}

