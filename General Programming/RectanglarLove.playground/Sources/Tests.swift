import XCTest

public class Tests: XCTestCase {
    
    func testOverlapAlongBothAxes() {
        let rect1 = Rectangle(leftX: 1, bottomY: 1, width: 6, height: 3)
        let rect2 = Rectangle(leftX: 5, bottomY: 2, width: 3, height: 6)
        
        let actual = Solution().findRectangularOverlap(rect1: rect1, rect2: rect2)
        let expected = Rectangle(leftX: 5, bottomY: 2, width: 2, height: 2)
        XCTAssertEqual(actual, expected)
    }
    
    func testOneRectangleInsideAnother() {
        let rect1 = Rectangle(leftX: 1, bottomY: 1, width: 6, height: 6)
        let rect2 = Rectangle(leftX: 3, bottomY: 3, width: 2, height: 2)
        
        let actual = Solution().findRectangularOverlap(rect1: rect1, rect2: rect2)
        let expected = Rectangle(leftX: 3, bottomY: 3, width: 2, height: 2)
        XCTAssertEqual(actual, expected)
    }
    
    func testBothRectanglesTheSame() {
        let rect1 = Rectangle(leftX: 2, bottomY: 2, width: 4, height: 4)
        let rect2 = Rectangle(leftX: 2, bottomY: 2, width: 4, height: 4)
        
        let actual = Solution().findRectangularOverlap(rect1: rect1, rect2: rect2)
        let expected = Rectangle(leftX: 2, bottomY: 2, width: 4, height: 4)
        XCTAssertEqual(actual, expected)
    }
    
    func testTouchOnHorizontalEdge() {
        let rect1 = Rectangle(leftX: 1, bottomY: 2, width: 3, height: 4)
        let rect2 = Rectangle(leftX: 2, bottomY: 6, width: 2, height: 2)
        
        let actual = Solution().findRectangularOverlap(rect1: rect1, rect2: rect2)
        XCTAssertNil(actual)
    }
    
    func testTouchOnVerticalEdge() {
        let rect1 = Rectangle(leftX: 1, bottomY: 2, width: 3, height: 4)
        let rect2 = Rectangle(leftX: 4, bottomY: 3, width: 2, height: 2)
        
        let actual = Solution().findRectangularOverlap(rect1: rect1, rect2: rect2)
        XCTAssertNil(actual)
    }
    
    func testTouchAtACorner() {
        let rect1 = Rectangle(leftX: 1, bottomY: 1, width: 2, height: 2)
        let rect2 = Rectangle(leftX: 3, bottomY: 3, width: 2, height: 2)
        
        let actual = Solution().findRectangularOverlap(rect1: rect1, rect2: rect2)
        XCTAssertNil(actual)
    }
    
    func testNoOverlap() {
        let rect1 = Rectangle(leftX: 1, bottomY: 1, width: 2, height: 2)
        let rect2 = Rectangle(leftX: 4, bottomY: 6, width: 3, height: 6)
        
        let actual = Solution().findRectangularOverlap(rect1: rect1, rect2: rect2)
        XCTAssertNil(actual)
    }
}

