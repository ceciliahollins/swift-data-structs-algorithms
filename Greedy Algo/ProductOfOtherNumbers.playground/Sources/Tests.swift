import XCTest

public class Tests: XCTestCase {
    
    func testSmallArray() {
        let actual = Solution().getProductsOfAllIntsExceptAtIndex([1, 2, 3])
        let expected = [6, 3, 2]
        assertArraysEqual(actual, expected)
    }
    
    func testLongerArray() {
        let actual = Solution().getProductsOfAllIntsExceptAtIndex([8, 2, 4, 3, 1, 5])
        let expected = [120, 480, 240, 320, 960, 192]
        assertArraysEqual(actual, expected)
    }
    
    func testArrayHasOneZero() {
        let actual = Solution().getProductsOfAllIntsExceptAtIndex([6, 2, 0, 3])
        let expected = [0, 0, 36, 0]
        assertArraysEqual(actual, expected)
    }
    
    func testArrayHasTwoZeros() {
        let actual = Solution().getProductsOfAllIntsExceptAtIndex([4, 0, 9, 1, 0])
        let expected = [0, 0, 0, 0, 0]
        assertArraysEqual(actual, expected)
    }
    
    func testOneNegativeNumber() {
        let actual = Solution().getProductsOfAllIntsExceptAtIndex([-3, 8, 4])
        let expected = [32, -12, -24]
        assertArraysEqual(actual, expected)
    }
    
    func testAllNegativeNumbers() {
        let actual = Solution().getProductsOfAllIntsExceptAtIndex([-7, -1, -4, -2])
        let expected = [-8, -56, -14, -28]
        assertArraysEqual(actual, expected)
    }
    
    func testErrorWithEmptyArray() {
        let actual = Solution().getProductsOfAllIntsExceptAtIndex([])
        XCTAssertNil(actual)
    }
    
    func testErrorWithOneNumber() {
        let actual = Solution().getProductsOfAllIntsExceptAtIndex([1])
        XCTAssertNil(actual)
    }
}

func assertArraysEqual(_ actual: [Int]?, _ expected: [Int]) {
    if let actual = actual {
        XCTAssertEqual(actual, expected)
    } else {
        XCTFail("actual is nil")
    }
}

