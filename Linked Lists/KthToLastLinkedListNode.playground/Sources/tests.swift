import XCTest

public class Tests: XCTestCase {
    
    func testFirstToLastNode() {
            let nodes = linkedListNodes(from: [1, 2, 3, 4])
            let actual = try? kthToLastNode(at: 1, forHead: nodes[0])
            let expected = nodes[3]
            XCTAssertTrue(actual === expected)
        }

        func testSecondToLastNode() {
            let nodes = linkedListNodes(from: [1, 2, 3, 4])
            let actual = try? kthToLastNode(at: 2, forHead: nodes[0])
            let expected = nodes[2]
            XCTAssertTrue(actual === expected)
        }

        func testFirstNode() {
            let nodes = linkedListNodes(from: [1, 2, 3, 4])
            let actual = try? kthToLastNode(at: 4, forHead: nodes[0])
            let expected = nodes[0]
            XCTAssertTrue(actual === expected)
        }

        func testKGreaterThanLinkedListLength() {
            let nodes = linkedListNodes(from: [1, 2, 3, 4])
            do {
                let _ = try kthToLastNode(at: 5, forHead: nodes[0])
                XCTFail()
            } catch {
                // test passed
            }
        }

        func testKIsZero() {
            let nodes = linkedListNodes(from: [1, 2, 3, 4])
            do {
                let _ = try kthToLastNode(at: 0, forHead: nodes[0])
                XCTFail()
            } catch {
                // test passed
            }
        }

        private func linkedListNodes(from values: [Int]) -> [LinkedListNode<Int>] {
            var nodes: [LinkedListNode<Int>] = []
            for (index, value) in values.enumerated() {
                nodes.append(LinkedListNode<Int>(value))
                if index > 0 {
                    nodes[index - 1].next = nodes[index]
                }
            }
            return nodes
        }
}

