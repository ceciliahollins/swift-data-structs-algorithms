import XCTest

public class Tests: XCTestCase {
    
    func testValidShortCode() {
        let result = Solution().isValid(code: "()")
        XCTAssertTrue(result)
    }
    
    func testValidLongerCode() {
        let result = Solution().isValid(code: "([]{[]})[]{{}()}")
        XCTAssertTrue(result)
    }
    
    func testInterleavedOpenersAndClosers() {
        let result = Solution().isValid(code: "([)]")
        XCTAssertFalse(result)
    }
    
    func testMismatchedOpenerAndCloser() {
        let result = Solution().isValid(code: "([][]}")
        XCTAssertFalse(result)
    }
    
    func testMissingCloser() {
        let result = Solution().isValid(code: "[[]()")
        XCTAssertFalse(result)
    }
    
    func testExtraCloser() {
        let result = Solution().isValid(code: "[[]]())")
        XCTAssertFalse(result)
    }
    
    func testEmptyString() {
        let result = Solution().isValid(code: "")
        XCTAssertTrue(result)
    }
}

