import XCTest

func XCTAssertEqual(_ actual: Double?, _ expected: Double, accuracy: Double,
                    _ message: String, line: UInt = #line) {
    if let actual = actual {
        XCTAssertEqual(actual, expected, accuracy: accuracy, message, line: line)
    } else {
        XCTAssertEqual(nil, expected, message, line: line)
    }
}

public class Tests: XCTestCase {
    
    func testTemperatureTracker() {
        let precision = 1e-6
        var msg: String
        
        let tracker = Solution()
        
        tracker.insert(temperature: 50)
        msg = "failed on first temp recorded"
        XCTAssertEqual(tracker.getMax(), 50, "max \(msg)")
        XCTAssertEqual(tracker.getMin(), 50, "min \(msg)")
        XCTAssertEqual(tracker.getMean(), 50.0, accuracy: precision, "mean \(msg)")
        XCTAssertEqual(tracker.getMode(), 50, "mode \(msg)")
        
        tracker.insert(temperature: 80)
        msg = "failed on higher temp recorded"
        XCTAssertEqual(tracker.getMax(), 80, "max \(msg)")
        XCTAssertEqual(tracker.getMin(), 50, "min \(msg)")
        XCTAssertEqual(tracker.getMean(), 65.0, accuracy: precision, "mean \(msg)")
        XCTAssert(tracker.getMode() == 50 || tracker.getMode() == 80, "mode \(msg)")
        
        tracker.insert(temperature: 80)
        msg = "failed on third temp recorded"
        XCTAssertEqual(tracker.getMax(), 80, "max \(msg)")
        XCTAssertEqual(tracker.getMin(), 50, "min \(msg)")
        XCTAssertEqual(tracker.getMean(), 70.0, accuracy: precision, "mean \(msg)")
        XCTAssertEqual(tracker.getMode(), 80, "mode \(msg)")
        
        tracker.insert(temperature: 30)
        msg = "failed on lower temp recorded"
        XCTAssertEqual(tracker.getMax(), 80, "max \(msg)")
        XCTAssertEqual(tracker.getMin(), 30, "min \(msg)")
        XCTAssertEqual(tracker.getMean(), 60.0, accuracy: precision, "mean \(msg)")
        XCTAssertEqual(tracker.getMode(), 80, "mode \(msg)")
    }
}

