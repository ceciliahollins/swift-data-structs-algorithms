import XCTest

public class Tests: XCTestCase {
    
    func testEmptyString() {
        var actual = Array("")
        let expected = Array("")
        Solution().reverse(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testSingleCharacterString() {
        var actual = Array("A")
        let expected = Array("A")
        Solution().reverse(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testLongerString() {
        var actual = Array("ABCDE")
        let expected = Array("EDCBA")
        Solution().reverse(&actual)
        XCTAssertEqual(actual, expected)
    }
}

