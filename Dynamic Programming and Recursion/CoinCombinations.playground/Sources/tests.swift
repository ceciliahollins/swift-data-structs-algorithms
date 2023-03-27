
import XCTest

public class Tests: XCTestCase {

    let change = ChangePossibilities()

    func testSampleInput() {
        let actual = change.changePossibilities(amount: 4, denominations: [1, 2, 3])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }

    func testOneWayToMakeZeroCents() {
        let actual = change.changePossibilities(amount: 0, denominations: [1, 2])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }

    func testNoWaysIfNoCoins() {
        let actual = change.changePossibilities(amount: 1, denominations: [])
        let expected = 0
        XCTAssertEqual(actual, expected)
    }

    func testBigCoinValue() {
        let actual = change.changePossibilities(amount: 5, denominations: [25, 50])
        let expected = 0
        XCTAssertEqual(actual, expected)
    }

    func testBigTargetAmount() {
        let actual = change.changePossibilities(amount: 50, denominations: [5, 10])
        let expected = 6
        XCTAssertEqual(actual, expected)
    }

    func testChangeForOneDollar() {
        let actual = change.changePossibilities(amount: 100, denominations: [1, 5, 10, 25, 50])
        let expected = 292
        XCTAssertEqual(actual, expected)
    }
    
}
