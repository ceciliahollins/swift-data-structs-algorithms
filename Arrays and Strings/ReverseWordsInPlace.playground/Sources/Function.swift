import Foundation

struct Solution {
    
    func reverseWords(_ message: inout [Character]) {
        
        // check that the message is not empty or the message has at least two words to swap
        guard message.contains(" ") else { return }
        
        // reverse the entire message by swapping characters
        // see ReverseStringInPlace.playground for explantation
        for currIndex in 0..<message.count/2 {
            
            let oppositeIndex = message.count - (currIndex + 1)
            
            let tempElement = message[currIndex]
            message[currIndex] = message[oppositeIndex]
            message[oppositeIndex] = tempElement
        }
        
        // iterate through the message, reversing each word by swapping character in that word
        var wordStart = message.startIndex
        var wordEnd = message.firstIndex(of: " ")!
        
        while wordStart < message.endIndex {
                        
            // reverse the word by swapping characters
            for currIndex in wordStart..<wordStart+((wordEnd-wordStart)/2) {
                let oppositeIndex = wordEnd - (currIndex - wordStart + 1)
                
                let tempElement = message[currIndex]
                message[currIndex] = message[oppositeIndex]
                message[oppositeIndex] = tempElement
            }
                        
            // update to start on the next word
            wordStart = wordEnd == message.endIndex ? wordEnd : message.index(after: wordEnd)
            wordEnd = wordStart
            
            // find the next space in the message or the end of the message
            while wordEnd != message.endIndex && message[wordEnd] != " " {
                wordEnd = message.index(after: wordEnd)
            }
        }
    }
}

