import XCTest

public class Tests: XCTestCase {
    
    let colors = ["red", "green", "blue", "orange", "yellow", "white"]
    
    func testLineGraph() {
        let nodeA = GraphNode("A")
        let nodeB = GraphNode("B")
        let nodeC = GraphNode("C")
        let nodeD = GraphNode("D")
        
        nodeA.neighbors.insert(nodeB)
        nodeB.neighbors.insert(nodeA)
        nodeB.neighbors.insert(nodeC)
        nodeC.neighbors.insert(nodeB)
        nodeC.neighbors.insert(nodeD)
        nodeD.neighbors.insert(nodeC)
        
        let graph = [nodeA, nodeB, nodeC, nodeD]
        XCTAssertNoThrow(try Solution().color(graph: graph, withColors: colors))
        assertGraphColoring(for: graph, withColors: colors)
    }
    
    func testSeparateGraph() {
        let nodeA = GraphNode("A")
        let nodeB = GraphNode("B")
        let nodeC = GraphNode("C")
        let nodeD = GraphNode("D")
        
        nodeA.neighbors.insert(nodeB)
        nodeB.neighbors.insert(nodeA)
        nodeC.neighbors.insert(nodeD)
        nodeD.neighbors.insert(nodeC)
        
        let graph = [nodeA, nodeB, nodeC, nodeD]
        XCTAssertNoThrow(try Solution().color(graph: graph, withColors: colors))
        assertGraphColoring(for: graph, withColors: colors)
    }
    
    func testTriangleGraph() {
        let nodeA = GraphNode("A")
        let nodeB = GraphNode("B")
        let nodeC = GraphNode("C")
        
        nodeA.neighbors.insert(nodeB)
        nodeA.neighbors.insert(nodeC)
        nodeB.neighbors.insert(nodeA)
        nodeB.neighbors.insert(nodeC)
        nodeC.neighbors.insert(nodeA)
        nodeC.neighbors.insert(nodeB)
        
        let graph = [nodeA, nodeB, nodeC]
        XCTAssertNoThrow(try Solution().color(graph: graph, withColors: colors))
        assertGraphColoring(for: graph, withColors: colors)
    }
    
    func testEnvelopeGraph() {
        let nodeA = GraphNode("A")
        let nodeB = GraphNode("B")
        let nodeC = GraphNode("C")
        let nodeD = GraphNode("D")
        let nodeE = GraphNode("E")
        
        nodeA.neighbors.insert(nodeB)
        nodeA.neighbors.insert(nodeC)
        nodeB.neighbors.insert(nodeA)
        nodeB.neighbors.insert(nodeC)
        nodeB.neighbors.insert(nodeD)
        nodeB.neighbors.insert(nodeE)
        nodeC.neighbors.insert(nodeA)
        nodeC.neighbors.insert(nodeB)
        nodeC.neighbors.insert(nodeD)
        nodeC.neighbors.insert(nodeE)
        nodeD.neighbors.insert(nodeB)
        nodeD.neighbors.insert(nodeC)
        nodeD.neighbors.insert(nodeE)
        nodeE.neighbors.insert(nodeB)
        nodeE.neighbors.insert(nodeC)
        nodeE.neighbors.insert(nodeD)
        
        let graph = [nodeA, nodeB, nodeC, nodeD, nodeE]
        XCTAssertNoThrow(try Solution().color(graph: graph, withColors: colors))
        assertGraphColoring(for: graph, withColors: colors)
    }
    
    func testLoopGraphThrowsError() {
        let nodeA = GraphNode("A")
        
        nodeA.neighbors.insert(nodeA)
        
        let graph = [nodeA]
        XCTAssertThrowsError(try Solution().color(graph: graph, withColors: colors))
    }
    
    private func assertGraphColoring(for graph: [GraphNode], withColors colors: [String]) {
        guard assertGraph(graph, hasColors: colors) else { return }
        assertGraphColorLimit(graph)
        for node in graph {
            assertNodeHasUniqueColor(node)
        }
    }
    
    private func assertGraph(_ graph: [GraphNode], hasColors colors: [String]) -> Bool {
        for node in graph {
            guard let nodeColor = node.color else {
                XCTFail("Found non-colored node \(node.label)")
                return false
            }
            let msg = "Node \(node) color \(nodeColor) not in \(colors)"
            XCTAssertTrue(colors.contains(nodeColor), msg)
        }
        return true
    }
    
    private func assertGraphColorLimit(_ graph: [GraphNode]) {
        let usedColors = Set(graph.map { $0.color! }).count
        let maxColors = maxDegree(of: graph) + 1
        
        let msg = "Used \(usedColors) colors and expected \(maxColors) at most"
        XCTAssertLessThanOrEqual(usedColors, maxColors, msg)
    }
    
    private func assertNodeHasUniqueColor(_ node: GraphNode) {
        for adjacent in node.neighbors {
            let msg = "Adjacent nodes \(node) and \(adjacent) " +
            "have the same color \(node.color!)"
            XCTAssertNotEqual(node.color, adjacent.color, msg)
        }
    }
    
    private func maxDegree(of graph: [GraphNode]) -> Int {
        var maxDegree = 0
        for node in graph {
            maxDegree = max(maxDegree, node.neighbors.count)
        }
        return maxDegree
    }
}

