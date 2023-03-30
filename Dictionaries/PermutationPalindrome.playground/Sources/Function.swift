import Foundation

struct Solution {
    
    func hasPalindromePermutation(in theString: String) -> Bool {

        var uniqueChars: Set<Character> = []
        
        for char in theString {
            if uniqueChars.contains(char) {
                uniqueChars.remove(char)
            } else {
                uniqueChars.insert(char)
            }
        }
        
        return uniqueChars.count <= 1
    }
}

