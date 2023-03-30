import XCTest

public class Tests: XCTestCase {
    
    func testMaxStack() {
        let stack = Solution()
        stack.push(5)
        XCTAssertEqual(5, stack.getMax())
        stack.push(4)
        stack.push(7)
        stack.push(7)
        stack.push(8)
        XCTAssertEqual(8, stack.getMax())
        XCTAssertEqual(8, stack.pop())
        XCTAssertEqual(7, stack.getMax())
        XCTAssertEqual(7, stack.pop())
        XCTAssertEqual(7, stack.getMax())
        XCTAssertEqual(7, stack.pop())
        XCTAssertEqual(5, stack.getMax())
        XCTAssertEqual(4, stack.pop())
        XCTAssertEqual(5, stack.getMax())
    }
}

