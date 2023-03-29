import XCTest

public class Tests: XCTestCase {
    
    func testBothRegistersHaveSameNumberOfOrders() {
        let result = Solution().isFirstComeFirstServed(
            takeOutOrders: [1, 4, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 2, 3, 4, 5, 6]
        )
        XCTAssertTrue(result)
    }
    
    func testRegistersHaveDifferentLengths() {
        let result = Solution().isFirstComeFirstServed(
            takeOutOrders: [1, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 2, 6, 3, 5]
        )
        XCTAssertFalse(result)
    }
    
    func testOneRegisterIsEmpty() {
        let result = Solution().isFirstComeFirstServed(
            takeOutOrders: [],
            dineInOrders: [2, 3, 6],
            servedOrders: [2, 3, 6]
        )
        XCTAssertTrue(result)
    }
    
    func testServedOrdersIsMissingOrders() {
        let result = Solution().isFirstComeFirstServed(
            takeOutOrders: [1, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 6, 3, 5]
        )
        XCTAssertFalse(result)
    }
    
    func testServedOrdersHasExtraOrders() {
        let result = Solution().isFirstComeFirstServed(
            takeOutOrders: [1, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 2, 3, 5, 6, 8]
        )
        XCTAssertFalse(result)
    }
    
    func testOneRegisterHasExtraOrders() {
        let result = Solution().isFirstComeFirstServed(
            takeOutOrders: [1, 9],
            dineInOrders: [7, 8],
            servedOrders: [1, 7, 8]
        )
        XCTAssertFalse(result)
    }
    
    func testOneRegisterHasUnservedOrders() {
        let result = Solution().isFirstComeFirstServed(
            takeOutOrders: [55, 9],
            dineInOrders: [7, 8],
            servedOrders: [1, 7, 8, 9]
        )
        XCTAssertFalse(result)
    }
    
    func testOrderNumbersAreNotSequential() {
        let result = Solution().isFirstComeFirstServed(
            takeOutOrders: [27, 12, 18],
            dineInOrders: [55, 31, 8],
            servedOrders: [55, 31, 8, 27, 12, 18]
        )
        XCTAssertTrue(result)
    }
}

