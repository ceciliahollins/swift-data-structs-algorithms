import XCTest

public class Tests: XCTestCase {
    
    func testOneWord() {
        let expected = Array("vault")
        var actual = Array("vault")
        Solution().reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testTwoWords() {
        let expected = Array("cake thief")
        var actual = Array("thief cake")
        Solution().reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testThreeWords() {
        let expected = Array("get another one")
        var actual = Array("one another get")
        Solution().reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testMultipleWordsSameLength() {
        let expected = Array("the cat ate the rat")
        var actual = Array("rat the ate cat the")
        Solution().reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testMultipleWordsDifferentLengths() {
        let expected = Array("chocolate bundt cake is yummy")
        var actual = Array("yummy is cake bundt chocolate")
        Solution().reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testEmptyString() {
        let expected = Array("")
        var actual = Array("")
        Solution().reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
}

