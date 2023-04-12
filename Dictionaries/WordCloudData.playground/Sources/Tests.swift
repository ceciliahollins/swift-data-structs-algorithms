import XCTest

public class Tests: XCTestCase {
    
    func testSimpleSentence() {
        let input = "I like cake"
        let wordCloud = Solution(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["i": 1, "like": 1, "cake": 1]
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
            "chocolate": 1,
            "dinner": 1,
            "cake": 2
        ]
        XCTAssertEqual(actual, expected)
    }

    func testPunctuation() {
        let input = "Strawberry short cake? Yum!"
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected = ["cake": 1, "strawberry": 1, "short": 1, "yum": 1]
        XCTAssertEqual(actual, expected)
    }

    func testHyphenatedWords() {
        let input = "Dessert - mille-feuille cake"
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected = ["cake": 1, "dessert": 1, "mille-feuille": 1]
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
        let expected = ["bakery": 1, "cakes": 1, "allie's": 1, "sasha's": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testParenthesis() {
        let input = "I (sometimes) like vanilla cake"
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected = ["i": 1, "sometimes": 1, "like": 1, "vanilla": 1, "cake": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testSingleQuotations() {
        let input = "In the words of Marie-Antoinette, `let them eat cake`."
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected = ["in": 1, "the": 1, "words": 1, "of": 1, "marie-antoinette": 1, "let": 1, "them": 1, "eat": 1, "cake": 1,]
        XCTAssertEqual(actual, expected)
    }
    
    func testDoubleQuotations() {
        let input = "He said \"Cake!\""
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected = ["he": 1, "said": 1, "cake": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testAmpersand() {
        let input = "Chocolate & vanilla"
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected = ["chocolate": 1, "vanilla": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testSemiColon() {
        let input = "She left; I ate cake"
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected = ["she": 1, "left": 1, "i": 1, "ate": 1, "cake": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testEmpty() {
        let input = ""
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected: [String: Int] = [:]
        XCTAssertEqual(actual, expected)
    }
    
    func testAllPuncuation() {
        let input = "?!"
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected: [String: Int] = [:]
        XCTAssertEqual(actual, expected)
    }
    
    func testSentenceStartsWithPuncuation() {
        let input = "...cake?"
        let wordCloud = Solution(input)

        let actual = wordCloud.wordsToCounts
        let expected = ["cake": 1]
        XCTAssertEqual(actual, expected)
    }
}

