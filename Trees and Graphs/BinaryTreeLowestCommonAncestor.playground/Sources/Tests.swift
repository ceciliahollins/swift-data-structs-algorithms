import XCTest

public class Tests: XCTestCase {

    func testNodesOnSeperateBranches() {
        let three = TreeNode(3)
        let five = TreeNode(5)
        let one = TreeNode(1)
        three.insert(left: five)
        three.insert(right: one)
        let six = TreeNode(6)
        let two = TreeNode(2)
        let zero = TreeNode(0)
        let eight = TreeNode(8)
        five.insert(left: six)
        five.insert(right: two)
        one.insert(left: zero)
        one.insert(right: eight)
        let seven = TreeNode(7)
        let four = TreeNode(4)
        two.insert(left: seven)
        two.insert(right: four)

        let result = Solution().lowestCommonAncestor(three, five, one)?.val
        XCTAssertEqual(result, 3)
    }
    
    func testNodesOnSameBranch() {
        let three = TreeNode(3)
        let five = TreeNode(5)
        let one = TreeNode(1)
        three.insert(left: five)
        three.insert(right: one)
        let six = TreeNode(6)
        let two = TreeNode(2)
        let zero = TreeNode(0)
        let eight = TreeNode(8)
        five.insert(left: six)
        five.insert(right: two)
        one.insert(left: zero)
        one.insert(right: eight)
        let seven = TreeNode(7)
        let four = TreeNode(4)
        two.insert(left: seven)
        two.insert(right: four)

        let result = Solution().lowestCommonAncestor(three, five, four)?.val
        XCTAssertEqual(result, 5)
    }
    
    func testRootIsNode() {
        let three = TreeNode(3)
        let five = TreeNode(5)
        let one = TreeNode(1)
        three.insert(left: five)
        three.insert(right: one)
        let six = TreeNode(6)
        let two = TreeNode(2)
        let zero = TreeNode(0)
        let eight = TreeNode(8)
        five.insert(left: six)
        five.insert(right: two)
        one.insert(left: zero)
        one.insert(right: eight)
        let seven = TreeNode(7)
        let four = TreeNode(4)
        two.insert(left: seven)
        two.insert(right: four)

        let result = Solution().lowestCommonAncestor(three, three, four)?.val
        XCTAssertEqual(result, 3)
    }
    
    func testDeepNodesFarApart() {
        let three = TreeNode(3)
        let five = TreeNode(5)
        let one = TreeNode(1)
        three.insert(left: five)
        three.insert(right: one)
        let six = TreeNode(6)
        let two = TreeNode(2)
        let zero = TreeNode(0)
        let eight = TreeNode(8)
        five.insert(left: six)
        five.insert(right: two)
        one.insert(left: zero)
        one.insert(right: eight)
        let seven = TreeNode(7)
        let four = TreeNode(4)
        two.insert(left: seven)
        two.insert(right: four)

        let result = Solution().lowestCommonAncestor(three, six, eight)?.val
        XCTAssertEqual(result, 3)
    }
    
    func testDeepNodesCloseTogether() {
        let three = TreeNode(3)
        let five = TreeNode(5)
        let one = TreeNode(1)
        three.insert(left: five)
        three.insert(right: one)
        let six = TreeNode(6)
        let two = TreeNode(2)
        let zero = TreeNode(0)
        let eight = TreeNode(8)
        five.insert(left: six)
        five.insert(right: two)
        one.insert(left: zero)
        one.insert(right: eight)
        let seven = TreeNode(7)
        let four = TreeNode(4)
        two.insert(left: seven)
        two.insert(right: four)

        let result = Solution().lowestCommonAncestor(three, seven, four)?.val
        XCTAssertEqual(result, 2)
    }
    
    func testNilRoot() {
        let result = Solution().lowestCommonAncestor(nil, nil, nil)?.val
        XCTAssertEqual(result, nil)
    }
    
    func testNilP() {
        let three = TreeNode(3)
        let five = TreeNode(5)
        three.insert(left: five)

        let result = Solution().lowestCommonAncestor(three, nil, five)?.val
        XCTAssertEqual(result, nil)
    }
    
    func testNilQ() {
        let three = TreeNode(3)
        let five = TreeNode(5)
        three.insert(left: five)

        let result = Solution().lowestCommonAncestor(three, five, nil)?.val
        XCTAssertEqual(result, nil)
    }
}

