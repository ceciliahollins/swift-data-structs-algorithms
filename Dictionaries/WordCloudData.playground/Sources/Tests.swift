import XCTest

public class Tests: XCTestCase {
    
    func testSimpleSentence() {
        let input = "I like cake"
        let wordCloud = Solution(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["I": 1, "like": 1, "cake": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testLongerSentence() {
        let input = "Chocolate cake for dinner and pound cake for dessert"
        let wordCloud = Solution(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = [
            "and": 1,
            "pound": 1,
            "for": 2,
            "dessert": 1,
            "Chocolate": 1,
            "dinner": 1,
            "cake": 2
        ]
        XCTAssertEqual(actual, expected)
    }
    
    func testPunctuation() {
        let input = "Strawberry short cake? Yum!"
        let wordCloud = Solution(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["cake": 1, "Strawberry": 1, "short": 1, "Yum": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testHyphenatedWords() {
        let input = "Dessert - mille-feuille cake"
        let wordCloud = Solution(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["cake": 1, "Dessert": 1, "mille-feuille": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testEllipsesBetweenWords() {
        let input = "Mmm...mmm...decisions...decisions"
        let wordCloud = Solution(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["mmm": 2, "decisions": 2]
        XCTAssertEqual(actual, expected)
    }
    
    func testApostrophes() {
        let input = "Allie's Bakery: Sasha's Cakes"
        let wordCloud = Solution(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["Bakery": 1, "Cakes": 1, "Allie's": 1, "Sasha's": 1]
        XCTAssertEqual(actual, expected)
    }
}

