import XCTest

public class Tests: XCTestCase {
    
    func testAllOpenersThenClosers() {
        let word = "((((()))))"
        let index = word.index(word.startIndex, offsetBy: 2)
        let actual = Solution().getClosingParen(for: word, openingParenIndex: index)
        let expected = word.index(word.startIndex, offsetBy: 7)
        XCTAssertEqual(actual, expected)
    }
    
    func testMixedOpenersAndClosers() {
        let word = "()()((()()))"
        let index = word.index(word.startIndex, offsetBy: 5)
        let actual = Solution().getClosingParen(for: word, openingParenIndex: index)
        let expected = word.index(word.startIndex, offsetBy: 10)
        XCTAssertEqual(actual, expected)
    }
    
    func testNoMatchingCloser() {
        let word = "()(()"
        let index = word.index(word.startIndex, offsetBy: 2)
        let result = Solution().getClosingParen(for: word, openingParenIndex: index)
        XCTAssertNil(result)
    }
}

