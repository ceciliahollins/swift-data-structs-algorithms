import XCTest

public class Tests: XCTestCase {
    
    func testEmptyArray() {
        let actual = Solution().findRotationPoint(in: [])
        let expected = -1
        XCTAssertEqual(actual, expected)
    }
    
    func testSingleArray() {
        let actual = Solution().findRotationPoint(in: ["cake"])
        let expected = 0
        XCTAssertEqual(actual, expected)
    }
    
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
    
    func testLargeArrayRotationInMiddle() {
        let actual = Solution().findRotationPoint(in: ["ptolemaic", "retrograde", "supplant",
                                                       "undulate", "xenoepist", "asymptote",
                                                       "babka", "banoffee", "engender",
                                                       "karpatka", "othellolagkage"])
        let expected = 5
        XCTAssertEqual(actual, expected)
    }
    
    func testLargeArrayRotationInBeginning() {
        let actual = Solution().findRotationPoint(in: ["xenoepist", "asymptote", "babka",
                                                       "banoffee", "engender", "karpatka",
                                                       "othellolagkage", "ptolemaic", "retrograde",
                                                       "supplant", "undulate"])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testLargeArrayRotationInEnd() {
        let actual = Solution().findRotationPoint(in: ["banoffee", "engender", "karpatka",
                                                       "othellolagkage", "ptolemaic", "retrograde",
                                                       "supplant", "undulate", "xenoepist",
                                                       "asymptote", "babka"])
        let expected = 9
        XCTAssertEqual(actual, expected)
    }
}

