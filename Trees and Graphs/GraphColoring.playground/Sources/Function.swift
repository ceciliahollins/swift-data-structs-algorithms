import Foundation

struct Solution {
    
    func color(graph: [GraphNode], withColors colors: [String]) throws {
        
        guard !graph.isEmpty else { throw GraphError.graphError }
        
        for node in graph {
            var possibleColors = colors
            
            for neighbor in node.neighbors {
                guard neighbor != node else { throw GraphError.graphError }
                if let takenColor = neighbor.color {
                    possibleColors = possibleColors.filter { $0 != takenColor }
                }
            }
            
            node.color = possibleColors[0]
        }
    }
}

class GraphNode {
    
    let label: String
    var neighbors = Set<GraphNode>()
    var color: String?
    
    init(_ label: String) {
        self.label = label
    }
}

extension GraphNode: Equatable {
    static func ==(lhs: GraphNode, rhs: GraphNode) -> Bool {
        return lhs.label == rhs.label // labels are unique in the graph
    }
}

extension GraphNode: Hashable {
    var hashValue: Int {
        return label.hashValue
    }
}

extension GraphNode: CustomStringConvertible {
    var description: String {
        return label
    }
}

enum GraphError: Error {
    case graphError
}
