import XCTest

public class Tests: XCTestCase {
    
    func testShortLinkedList() {
        let nodes = linkedListNodes(from: [1, 2])
        let result = Solution().reverseLinkedList(startingFrom: nodes[0])
        XCTAssertTrue(isListReversed(list: result, originalNodes: nodes))
    }
    
    func testLongLinkedList() {
        let nodes = linkedListNodes(from: [1, 2, 3, 4, 5, 6])
        let result = Solution().reverseLinkedList(startingFrom: nodes[0])
        XCTAssertTrue(isListReversed(list: result, originalNodes: nodes))
    }
    
    func testAllSameValueLinkedList() {
        let nodes = linkedListNodes(from: [1, 1, 1, 1])
        let result = Solution().reverseLinkedList(startingFrom: nodes[0])
        XCTAssertTrue(isListReversed(list: result, originalNodes: nodes))
    }

    func testOneElementLinkedList() {
        let node = LinkedListNode(1)
        let result = Solution().reverseLinkedList(startingFrom: node)
        XCTAssertTrue(node === result)
    }

    func testEmptyLinkedList() {
        let nilList: LinkedListNode<Int>? = nil
        let result = Solution().reverseLinkedList(startingFrom: nilList)
        XCTAssertNil(result)
    }
    
    private func linkedListNodes(from values: [Int]) -> [LinkedListNode<Int>] {
        var nodes: [LinkedListNode<Int>] = []
        for (index, value) in values.enumerated() {
            nodes.append(LinkedListNode(value))
            if index > 0 {
                nodes[index - 1].next = nodes[index]
            }
        }
        return nodes
    }
    
    private func isListReversed(list: LinkedListNode<Int>?, originalNodes: [LinkedListNode<Int>]) -> Bool {
        var currentNode = list
        for node in originalNodes.reversed() {
            if currentNode !== node {
                return false
            }
            currentNode = currentNode?.next
        }
        return currentNode == nil
    }
}

