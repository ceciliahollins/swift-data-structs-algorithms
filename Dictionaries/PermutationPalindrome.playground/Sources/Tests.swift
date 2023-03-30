import XCTest

public class Tests: XCTestCase {
    
    func testPermutationWithOddNumberOfChars() {
        let result = Solution().hasPalindromePermutation(in: "aabcbcd")
        XCTAssertTrue(result)
    }
    
    func testPermutationWithEvenNumberOfChars() {
        let result = Solution().hasPalindromePermutation(in: "aabccbdd")
        XCTAssertTrue(result)
    }
    
    func testNoPermutationWithOddNumberOfChars() {
        let result = Solution().hasPalindromePermutation(in: "aabcd")
        XCTAssertFalse(result)
    }
    
    func testNoPermutationWithEvenNumberOfChars() {
        let result = Solution().hasPalindromePermutation(in: "aabbcd")
        XCTAssertFalse(result)
    }
    
    func testEmptyString() {
        let result = Solution().hasPalindromePermutation(in: "")
        XCTAssertTrue(result)
    }
    
    func testOneCharacterString() {
        let result = Solution().hasPalindromePermutation(in: "a")
        XCTAssertTrue(result)
    }
    
    
    func testAllOneTypeWithOddNumber() {
        let result = Solution().hasPalindromePermutation(in: "aaaaa")
        XCTAssertTrue(result)
    }
    
    func testAllOneTypeWithEvenNumber() {
        let result = Solution().hasPalindromePermutation(in: "aaaaaa")
        XCTAssertTrue(result)
    }
}

