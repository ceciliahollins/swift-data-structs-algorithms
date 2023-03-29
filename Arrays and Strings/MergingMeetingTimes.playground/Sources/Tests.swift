import XCTest

import XCTest

public class Tests: XCTestCase {

    func testMeetingsOverlap() {
        let meetings = [
            Meeting(startTime: 1, endTime: 3),
            Meeting(startTime: 2, endTime: 4)
        ]
        let actual = Solution().mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 4)
        ]
        XCTAssertEqual(actual, expected)
    }

    func testMeetingsTouch() {
        let meetings = [
            Meeting(startTime: 5, endTime: 6),
            Meeting(startTime: 6, endTime: 8)
        ]
        let actual = Solution().mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 5, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }

    func testMeetingContainsOtherMeeting() {
        let meetings = [
            Meeting(startTime: 1, endTime: 8),
            Meeting(startTime: 2, endTime: 5)
        ]
        let actual = Solution().mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }

    func testMeetingsStaySeparate() {
        let meetings = [
            Meeting(startTime: 1, endTime: 3),
            Meeting(startTime: 4, endTime: 8)
        ]
        let actual = Solution().mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 3),
            Meeting(startTime: 4, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }

    func testMultipleMergedMeetings() {
        let meetings = [
            Meeting(startTime: 1, endTime: 4),
            Meeting(startTime: 2, endTime: 5),
            Meeting(startTime: 5, endTime: 8)
        ]
        let actual = Solution().mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }

    func testMeetingsNotSorted() {
        let meetings = [
            Meeting(startTime: 5, endTime: 8),
            Meeting(startTime: 1, endTime: 4),
            Meeting(startTime: 6, endTime: 8)
        ]
        let actual = Solution().mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 4),
            Meeting(startTime: 5, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }

    func testOneLongMeetingContainsSmallerMeetings() {
        let meetings = [
            Meeting(startTime: 1,  endTime: 10),
            Meeting(startTime: 2,  endTime: 5),
            Meeting(startTime: 6,  endTime: 8),
            Meeting(startTime: 9, endTime: 10),
            Meeting(startTime: 10,  endTime: 12)
        ]
        let actual = Solution().mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 12)
        ]
        XCTAssertEqual(actual, expected)
    }

    func testSampleInput() {
        let meetings = [
            Meeting(startTime: 0,  endTime: 1),
            Meeting(startTime: 3,  endTime: 5),
            Meeting(startTime: 4,  endTime: 8),
            Meeting(startTime: 10, endTime: 12),
            Meeting(startTime: 9,  endTime: 10)
        ]
        let actual = Solution().mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 0, endTime: 1),
            Meeting(startTime: 3, endTime: 8),
            Meeting(startTime: 9, endTime: 12)
        ]
        XCTAssertEqual(actual, expected)
    }
}

