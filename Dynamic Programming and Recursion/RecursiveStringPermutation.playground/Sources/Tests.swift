import XCTest

public class Tests: XCTestCase {
    
    func testEmptyString() {
        let actual = Solution().getPermutations(for: "")
        let expected: Set = [""]
        XCTAssertEqual(actual, expected)
    }
    
    func testOneCharacterString() {
        let actual = Solution().getPermutations(for: "a")
        let expected: Set = ["a"]
        XCTAssertEqual(actual, expected)
    }
    
    func testTwoCharacterString() {
        let actual = Solution().getPermutations(for: "ab")
        let expected: Set = ["ab", "ba"]
        XCTAssertEqual(actual, expected)
    }
    
    func testThreeCharacterString() {
        let actual = Solution().getPermutations(for: "abc")
        let expected: Set = ["abc", "acb", "bac", "bca", "cab", "cba"]
        XCTAssertEqual(actual, expected)
    }
}

