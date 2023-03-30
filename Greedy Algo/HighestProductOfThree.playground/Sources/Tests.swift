import XCTest

public class Tests: XCTestCase {
    
    func testShortArray() {
        let actual = try? Solution().highestProductOf3([1, 2, 3, 4])
        let expected = 24
        XCTAssertEqual(actual, expected)
    }
    
    func testLongerArray() {
        let actual = try? Solution().highestProductOf3([6, 1, 3, 5, 7, 8, 2])
        let expected = 336
        XCTAssertEqual(actual, expected)
    }
    
    func testArrayHasOneNegative() {
        let actual = try? Solution().highestProductOf3([-5, 4, 8, 2, 3])
        let expected = 96
        XCTAssertEqual(actual, expected)
    }
    
    func testArrayHasTwoNegatives() {
        let actual = try? Solution().highestProductOf3([-10, 1, 3, 2, -10])
        let expected = 300
        XCTAssertEqual(actual, expected)
    }
    
    func testArrayIsAllNegatives() {
        let actual = try? Solution().highestProductOf3([-5, -1, -3, -2])
        let expected = -6
        XCTAssertEqual(actual, expected)
    }
    
    func testErrorWithEmptyArray() {
        let actual = try? Solution().highestProductOf3([])
        let expected: Int? = nil
        XCTAssertEqual(actual, expected)
    }
    
    func testErrorWithOneNumber() {
        let actual = try? Solution().highestProductOf3([1])
        let expected: Int? = nil
        XCTAssertEqual(actual, expected)
    }
    
    func testErrorWithTwoNumbers() {
        let actual = try? Solution().highestProductOf3([1, 1])
        let expected: Int? = nil
        XCTAssertEqual(actual, expected)
    }
}

