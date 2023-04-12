import Foundation

class Solution {

    private var input: String
    private(set) var wordsToCounts: [String: Int] = [:]

    init(_ input: String) {
        self.input = input
    }

    private func populateWordsToCounts() {
        
        // check that the input is not empty and contains words
        guard !input.isEmpty && input.contains(where: { $0.isLetter() }) else { return }
        
        // get the start and end of the first word
        var wordStart = getWordStart(currWordEnd: input.startIndex)
        var wordEnd = getWordEnd(currWordStart: wordStart)
        
        while wordStart < input.endIndex {
            
            // get the word to populate
            let wordToPopulate = String(input[wordStart..<wordEnd]).lowercased()
            
            // add the word to the dictionary if not already and update the count
            if let count = wordsToCounts[wordToPopulate] {
                wordsToCounts[wordToPopulate] = count + 1
            } else {
                wordsToCounts[wordToPopulate] = 1
            }
            
            // find the start and end of the next word, accounting for puncuation
            let nextWordStart = wordEnd == input.endIndex ? wordEnd : input.index(after: wordEnd)
            wordStart = getWordStart(currWordEnd: nextWordStart)
            wordEnd = getWordEnd(currWordStart: wordStart)
        }
    }
    
    // A helper function to get the start of the next word
    func getWordStart(currWordEnd: String.Index) -> String.Index {
        var wordStart = currWordEnd
        
        // search through the input until the character is a letter or it is the end of the sentence
        while wordStart != input.endIndex && !input[wordStart].isLetter() {
            wordStart = input.index(after: wordStart)
        }
        
        return wordStart
    }
    
    // A helper function to get the end of the current word
    func getWordEnd(currWordStart: String.Index) -> String.Index {
        var wordEnd = currWordStart
        
        // search through the input until the character is a word splitting character or it is the end of the sentence
        while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() {
            wordEnd = input.index(after: wordEnd)
        }
        
        return wordEnd
    }
}

extension Character {
    // A helper function to determine if a character is a letter
    func isLetter() -> Bool {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(self)
    }
    
    // A helper function to determine if a character is one that signifies the end of a word
    func isSplittingWord() -> Bool {
        return " ,;:.!?:()&\"`".contains(self)
    }
}

