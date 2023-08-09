import XCTest

public class Tests: XCTestCase {
    
    let solution = Solution()
    
    func testZerothFibonacci() {
        let actual = solution.fib(0)
        let expected: Int = 0
        XCTAssertEqual(actual, expected)
    }
    
    func testFirstFibonacci() {
        let actual = solution.fib(1)
        let expected: Int = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testSecondFibonacci() {
        let actual = solution.fib(2)
        let expected: Int = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testThirdFibonacci() {
        let actual = solution.fib(3)
        let expected: Int = 2
        XCTAssertEqual(actual, expected)
    }
    
    func testFifthFibonacci() {
        let actual = solution.fib(5)
        let expected: Int = 5
        XCTAssertEqual(actual, expected)
    }
    
    func testTenthFibonacci() {
        let actual = solution.fib(10)
        let expected: Int = 55
        XCTAssertEqual(actual, expected)
    }
    
    func testVeryLargeFibonacci() {
        let actual = solution.fib(50)
        let expected: Int = 12586269025
        XCTAssertEqual(actual, expected)
    }
}

