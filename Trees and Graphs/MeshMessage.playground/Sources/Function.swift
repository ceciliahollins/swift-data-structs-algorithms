
struct Solution {
    
    func getPath(graph: [String: [String]],
                 startNode: String,
                 endNode: String,
                 visitedNodes: [String] = []) throws -> [String]? {
        
        var newVisitedNodes = visitedNodes
        newVisitedNodes.append(startNode)
        
        var possiblePaths: [[String]] = []
        guard let neighbors = graph[startNode],
              graph[endNode] != nil else { throw GraphError.graphError }
        
        for neighbor in neighbors {
            guard !newVisitedNodes.contains(neighbor) else { continue }
            
            if neighbor == endNode {
                return [startNode, endNode]
            }
            
            var possiblePath = try getPath(graph: graph, startNode: neighbor, endNode: endNode, visitedNodes: newVisitedNodes) ?? []
            possiblePath.insert(startNode, at: 0)
            possiblePaths.append(possiblePath)
        }
        
        possiblePaths = possiblePaths.sorted { $0.count < $1.count }
        possiblePaths = possiblePaths.filter { !$0.isEmpty && $0.first == startNode && $0.last == endNode}
        
        return possiblePaths.first
    }
}

struct Queue<Element> {
    private var queue: [Element] = []

    var count: Int {
        return queue.count
    }

    mutating func enqueue(_ element: Element) {
        queue.insert(element, at: 0)
    }

    mutating func dequeue() -> Element? {
        return queue.popLast()
    }
}

enum GraphError: Error {
    case graphError
}
