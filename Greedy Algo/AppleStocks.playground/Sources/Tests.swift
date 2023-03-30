import XCTest

public class Tests: XCTestCase {
    
    func testPriceGoesUpThenDown() {
        let actual = Solution().getMaxProfit(from: [1, 5, 3, 2])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }
    
    func testPriceGoesDownThenUp() {
        let actual = Solution().getMaxProfit(from: [7, 2, 8, 9])
        let expected = 7
        XCTAssertEqual(actual, expected)
    }
    
    func testBigIncreaseThenSmallIncrease() {
        let actual = Solution().getMaxProfit(from: [2, 10, 1, 4])
        let expected = 8
        XCTAssertEqual(actual, expected)
    }
    
    func testPriceGoesUpAllDay() {
        let actual = Solution().getMaxProfit(from: [1, 6, 7, 9])
        let expected = 8
        XCTAssertEqual(actual, expected)
    }
    
    func testPriceGoesDownAllDay() {
        let actual = Solution().getMaxProfit(from: [9, 7, 4, 1])
        let expected = -2
        XCTAssertEqual(actual, expected)
    }
    
    func testPriceStaysTheSameAllDay() {
        let actual = Solution().getMaxProfit(from: [1, 1, 1, 1])
        let expected = 0
        XCTAssertEqual(actual, expected)
    }
    
    func testReturnNilWithEmptyPrices() {
        let actual = Solution().getMaxProfit(from: [])
        XCTAssertNil(actual)
    }
    
    func testReturnNillWithOnePrice() {
        let actual = Solution().getMaxProfit(from: [1])
        XCTAssertNil(actual)
    }
}

