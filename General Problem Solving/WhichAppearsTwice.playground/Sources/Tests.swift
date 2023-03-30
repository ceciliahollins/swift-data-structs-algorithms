import XCTest

public class Tests: XCTestCase {
    
    func testShortArray() {
        let actual = Solution().findRepeat(in: [1, 2, 1])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testMediumArray() {
        let actual = Solution().findRepeat(in: [4, 1, 3, 4, 2])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }
    
    func testLongArray() {
        let actual = Solution().findRepeat(in: [1, 5, 9, 7, 2, 6, 3, 8, 2, 4])
        let expected = 2
        XCTAssertEqual(actual, expected)
    }
}

