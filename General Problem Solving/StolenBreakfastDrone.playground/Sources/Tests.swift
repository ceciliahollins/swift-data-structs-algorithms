import XCTest

public class Tests: XCTestCase {
    
    func testOneDrone() {
        let actual = Solution().findUniqueDeliveryId(in: [1])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testUniqueIdComesFirst() {
        let actual = Solution().findUniqueDeliveryId(in: [1, 2, 2])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testUniqueIdComesLast() {
        let actual = Solution().findUniqueDeliveryId(in: [3, 3, 2, 2, 1])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testUniqueIdInTheMiddle() {
        let actual = Solution().findUniqueDeliveryId(in: [3, 2, 1, 2, 3])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testManyDrones() {
        let actual = Solution().findUniqueDeliveryId(in: [2, 5, 4, 8, 6, 3, 1, 4, 2, 3, 6, 5, 1])
        let expected = 8
        XCTAssertEqual(actual, expected)
    }
}

