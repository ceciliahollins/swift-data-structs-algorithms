import XCTest

public class Tests: XCTestCase {

    func testOneCake() {
        let actual = Solution().maxDuffelBagValue(for: [CakeType(weight: 2, value: 1)], withCapacity: 9)
        let expected: Int = 4
        XCTAssertEqual(actual, expected)
    }

    func testTwoCakes() {
        let cakeTypes = [
            CakeType(weight: 4, value: 4),
            CakeType(weight: 5, value: 5)
        ]
        let actual = Solution().maxDuffelBagValue(for: cakeTypes, withCapacity: 9)
        let expected: Int = 9
        XCTAssertEqual(actual, expected)
    }

    func testOnlyTakeLessValuableCake() {
        let cakeTypes = [
            CakeType(weight: 4, value: 4),
            CakeType(weight: 5, value: 5)
        ]
        let actual = Solution().maxDuffelBagValue(for: cakeTypes, withCapacity: 12)
        let expected: Int = 12
        XCTAssertEqual(actual, expected)
    }

    func testLotsOfCakes() {
        let cakeTypes = [
            CakeType(weight: 2, value: 3),
            CakeType(weight: 3, value: 6),
            CakeType(weight: 5, value: 1),
            CakeType(weight: 6, value: 1),
            CakeType(weight: 7, value: 1),
            CakeType(weight: 8, value: 1)
        ]
        let actual = Solution().maxDuffelBagValue(for: cakeTypes, withCapacity: 7)
        let expected: Int = 12
        XCTAssertEqual(actual, expected)
    }

    func testValueToWeightRatioIsNotOptimal() {
        let cakeTypes = [
            CakeType(weight: 51, value: 52),
            CakeType(weight: 50, value: 50)
        ]
        let actual = Solution().maxDuffelBagValue(for: cakeTypes, withCapacity: 100)
        let expected: Int = 100
        XCTAssertEqual(actual, expected)
    }

    func testZeroCapacity() {
        let actual = Solution().maxDuffelBagValue(for: [CakeType(weight: 1, value: 2)], withCapacity: 0)
        let expected: Int = 0
        XCTAssertEqual(actual, expected)
    }

    func testCakeWithZeroValueAndWeight() {
        let cakeTypes = [
            CakeType(weight: 0, value: 0),
            CakeType(weight: 2, value: 1)
        ]
        let actual = Solution().maxDuffelBagValue(for: cakeTypes, withCapacity: 7)
        let expected: Int = 3
        XCTAssertEqual(actual, expected)
    }
}

