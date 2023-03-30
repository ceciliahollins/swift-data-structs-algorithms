import XCTest

public class Tests: XCTestCase {
    
    func testShortFlight() {
        let result = Solution().canTwoMovies(in: [2, 4], fillFlight: 1)
        XCTAssertFalse(result)
    }
    
    func testLongFlight() {
        let result = Solution().canTwoMovies(in: [2, 4], fillFlight: 6)
        XCTAssertTrue(result)
    }
    
    func testOneMovieHalfFlightLength() {
        let result = Solution().canTwoMovies(in: [3, 8], fillFlight: 6)
        XCTAssertFalse(result)
    }
    
    func testTwoMoviesHalfFlightLength() {
        let result = Solution().canTwoMovies(in: [3, 8, 3], fillFlight: 6)
        XCTAssertTrue(result)
    }
    
    func testLotsOfPossiblePairs() {
        let result = Solution().canTwoMovies(in: [1, 2, 3, 4, 5, 6], fillFlight: 7)
        XCTAssertTrue(result)
    }
    
    func testNotUsingFirstMovie() {
        let result = Solution().canTwoMovies(in: [4, 3, 2], fillFlight: 5)
        XCTAssertTrue(result)
    }
    
    func testMultipleMoviesShorterThanFlight() {
        let result = Solution().canTwoMovies(in: [5, 6, 7, 8], fillFlight: 9)
        XCTAssertFalse(result)
    }
    
    func testOnlyOneMovie() {
        let result = Solution().canTwoMovies(in: [6], fillFlight: 6)
        XCTAssertFalse(result)
    }
    
    func testNoMovies() {
        let result = Solution().canTwoMovies(in: [], fillFlight: 2)
        XCTAssertFalse(result)
    }
}

