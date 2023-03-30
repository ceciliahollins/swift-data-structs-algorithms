import XCTest

public class Tests: XCTestCase {

    var first, second, third, fourth: LinkedListNode<Int>!

    public override func setUp() {
        super.setUp()
        fourth = LinkedListNode(4)
        third  = LinkedListNode(3, next: fourth)
        second = LinkedListNode(2, next: third)
        first  = LinkedListNode(1, next: second)
    }

    func testNodeAtBeginning() throws {
        try Solution().deleteNode(first)
        let actual = values(from: first)
        let expected = [2, 3, 4]
        XCTAssertEqual(actual, expected)
    }

    func testNodeInTheMiddle() throws {
        try Solution().deleteNode(second)
        let actual = values(from: first)
        let expected = [1, 3, 4]
        XCTAssertEqual(actual, expected)
    }

    func testNodeAtTheEnd() {
        do {
            try Solution().deleteNode(fourth)
            XCTFail()
        } catch {
            // test passed
        }
    }

    func testOneNodeList() {
        let head = LinkedListNode(1)
        do {
            try Solution().deleteNode(head)
            XCTFail()
        } catch {
            // test passed
        }
    }

    func values(from head: LinkedListNode<Int>) -> [Int] {
        var values: [Int] = []
        var current: LinkedListNode! = head
        while current != nil {
            values.append(current.value)
            current = current.next
        }
        return values
    }
}

