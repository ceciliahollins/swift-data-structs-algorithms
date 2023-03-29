import Foundation

class Solution {

    private(set) var wordsToCounts: [String: Int] = [:]

    init(_ input: String) {
        populateWordsToCounts(input)
    }

    private func populateWordsToCounts(_ input: String) {

        var string = input
        
        while !string.isEmpty {
            let nextSpace = string.firstIndex(of: " ") ?? string.index(before: string.endIndex) // get next space
            let startIndex = string.startIndex
            let substring = string[startIndex...nextSpace] // create the word from substring
            string.removeSubrange(startIndex...nextSpace) // remove the word from the string
            
            var word = String(substring)
            
            while !word.isEmpty,
                  !word.last!.isLetter() {
                word.removeLast() // clean the word by removing spaces and puncuation
            }
            
            guard !word.isEmpty else { continue }
            
            if wordsToCounts[word] != nil {
                wordsToCounts[word]! += 1
            } else {
                wordsToCounts[word] = 1
            }
        }
    }
}

extension Character {
    func isLetter() -> Bool {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(self)
    }
}

