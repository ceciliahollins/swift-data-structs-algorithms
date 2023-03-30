import XCTest

public class Tests: XCTestCase {

    func testBothArraysAreEmpty() {
        let myArray: [Int] = []
        let alicesArray: [Int] = []
        let actual = Solution().mergeArrays(myArray, alicesArray)
        let expected: [Int] = []
        XCTAssertEqual(actual, expected)
    }

    func testFirstArrayIsEmpty() {
        let myArray: [Int] = []
        let alicesArray = [1, 2, 3]
        let actual = Solution().mergeArrays(myArray, alicesArray)
        let expected = [1, 2, 3]
        XCTAssertEqual(actual, expected)
    }

    func testSecondArrayIsEmpty() {
        let myArray = [5, 6, 7]
        let alicesArray: [Int] = []
        let actual = Solution().mergeArrays(myArray, alicesArray)
        let expected = [5, 6, 7]
        XCTAssertEqual(actual, expected)
    }

    func testBothArraysHaveSomeNumbers() {
        let myArray = [2, 4, 6]
        let alicesArray = [1, 3, 7]
        let actual = Solution().mergeArrays(myArray, alicesArray)
        let expected = [1, 2, 3, 4, 6, 7]
        XCTAssertEqual(actual, expected)
    }

    func testArraysAreDifferentLengths() {
        let myArray = [2, 4, 6, 8]
        let alicesArray = [1, 7]
        let actual = Solution().mergeArrays(myArray, alicesArray)
        let expected = [1, 2, 4, 6, 7, 8]
        XCTAssertEqual(actual, expected)
    }
}

