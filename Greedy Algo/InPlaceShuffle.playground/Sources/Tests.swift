import XCTest

public class Tests: XCTestCase {

    func testSampleArray() {
        var sampleArray = [1, 2, 3, 4, 5]
        print("Sample array:")
        print(sampleArray)

        print("Shuffling sample array...")
        Solution().shuffle(array: &sampleArray)
        print(sampleArray)
    }
}

