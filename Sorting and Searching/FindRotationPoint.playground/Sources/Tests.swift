import XCTest

public class Tests: XCTestCase {
    
    func testSmallArray() {
        let actual = Solution().findRotationPoint(in: ["cape", "cake"])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testMediumArray() {
        let actual = Solution().findRotationPoint(in: ["grape", "orange",
                                            "plum", "radish", "apple"])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }
    
    func testLargeArray() {
        let actual = Solution().findRotationPoint(in: ["ptolemaic", "retrograde", "supplant",
                                            "undulate", "xenoepist", "asymptote",
                                            "babka", "banoffee", "engender",
                                            "karpatka", "othellolagkage"])
        let expected = 5
        XCTAssertEqual(actual, expected)
    }
}

