import XCTest

public class Tests: XCTestCase {
    
    func testBasicQueueOperations() {
        let queue = Solution<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        XCTAssertEqual(1, queue.dequeue())
        XCTAssertEqual(2, queue.dequeue())
        queue.enqueue(4)
        XCTAssertEqual(3, queue.dequeue())
        XCTAssertEqual(4, queue.dequeue())
    }
    
    func testNilWhenDequeueFromNewQueue() {
        let queue = Solution<Int>()
        XCTAssertNil(queue.dequeue())
    }
    
    func testNilWhenDequeueFromEmptyQueue() {
        let queue = Solution<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        XCTAssertEqual(1, queue.dequeue())
        XCTAssertEqual(2, queue.dequeue())
        XCTAssertNil(queue.dequeue())
    }
}

