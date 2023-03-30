import XCTest

public class Tests: XCTestCase {

    let graph = [
        "a": ["b", "c", "d"],
        "b": ["a", "d"],
        "c": ["a", "e"],
        "d": ["a", "b"],
        "e": ["c"],
        "f": ["g"],
        "g": ["f"]
    ]

    func testTwoHopPath1() {
        do {
            let actual = try Solution().getPath(graph: graph, startNode: "a", endNode: "e")
            let expected = ["a", "c", "e"]
            assertEqual(actual, expected)
        } catch {
            XCTFail("\(error)")
        }
    }

    func testTwoHopPath2() {
        do {
            let actual = try Solution().getPath(graph: graph, startNode: "d", endNode: "c")
            let expected = ["d", "a", "c"]
            assertEqual(actual, expected)
        } catch {
            XCTFail("\(error)")
        }
    }

    func testOneHopPath1() {
        do {
            let actual = try Solution().getPath(graph: graph, startNode: "a", endNode: "c")
            let expected = ["a", "c"]
            assertEqual(actual, expected)
        } catch {
            XCTFail("\(error)")
        }
    }

    func testOneHopPath2() {
        do {
            let actual = try Solution().getPath(graph: graph, startNode: "f", endNode: "g")
            let expected = ["f", "g"]
            assertEqual(actual, expected)
        } catch {
            XCTFail("\(error)")
        }
    }

    func testOneHopPath3() {
        do {
            let actual = try Solution().getPath(graph: graph, startNode: "g", endNode: "f")
            let expected = ["g", "f"]
            assertEqual(actual, expected)
        } catch {
            XCTFail("\(error)")
        }
    }

    func testZeroHopPath() {
        do {
            let actual = try Solution().getPath(graph: graph, startNode: "a", endNode: "a")
            let expected = ["a"]
            assertEqual(actual, expected)
        } catch {
            XCTFail("\(error)")
        }
    }

    func testNoPath() {
        do {
            let actual = try Solution().getPath(graph: graph, startNode: "a", endNode: "f")
            XCTAssertNil(actual)
        } catch {
            XCTFail("\(error)")
        }
    }

    func testStartNodeNotPresent() {
        XCTAssertThrowsError(try Solution().getPath(graph: graph, startNode: "h", endNode: "a"))
    }

    func testEndNodeNotPresent() {
        XCTAssertThrowsError(try Solution().getPath(graph: graph, startNode: "a", endNode: "h"))
    }
}

func assertEqual(_ actual: [String]?, _ expected: [String]) {
    guard let actual = actual else {
        XCTFail("actual is nil")
        return
    }
    XCTAssertEqual(actual, expected)
}

