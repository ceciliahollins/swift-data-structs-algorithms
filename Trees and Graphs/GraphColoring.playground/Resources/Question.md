# Graph Coloring
Source: [Interview Cake](https://www.interviewcake.com/question/swift/graph-coloring?course=fc1&section=trees-graphs)

## Given an undirected graph with maximum degree D, find a graph coloring using at most D+1 colors.

For example:
TODO: add figure-0

This graph's maximum degree (D) is 3, so we have 4 colors (D+1). Here's one possible coloring:
TODO: add figure-1


Graphs are represented by an array of N node objects, each with a label, a set of neighbors, and a color:
```swift
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

let a = GraphNode("a")
let b = GraphNode("b")
let c = GraphNode("c")

a.neighbors.insert(b)
b.neighbors.insert(a)
b.neighbors.insert(c)
c.neighbors.insert(b)

let graph = [a, b, c]
```
