
import XCTest

public class Tests: XCTestCase {

    func testSampleInput() {
        let actual = Solution().changePossibilities(amount: 4, denominations: [1, 2, 3])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }

    func testOneWayToMakeZeroCents() {
        let actual = Solution().changePossibilities(amount: 0, denominations: [1, 2])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }

    func testNoWaysIfNoCoins() {
        let actual = Solution().changePossibilities(amount: 1, denominations: [])
        let expected = 0
        XCTAssertEqual(actual, expected)
    }

    func testBigCoinValue() {
        let actual = Solution().changePossibilities(amount: 5, denominations: [25, 50])
        let expected = 0
        XCTAssertEqual(actual, expected)
    }

    func testBigTargetAmount() {
        let actual = Solution().changePossibilities(amount: 50, denominations: [5, 10])
        let expected = 6
        XCTAssertEqual(actual, expected)
    }

    func testChangeForOneDollar() {
        let actual = Solution().changePossibilities(amount: 100, denominations: [1, 5, 10, 25, 50])
        let expected = 292
        XCTAssertEqual(actual, expected)
    }
    
    func testNoPossibleCoinCombinations() {
        let actual = Solution().changePossibilities(amount: 7, denominations: [2, 4, 6])
        let expected = 0
        XCTAssertEqual(actual, expected)
    }
}
