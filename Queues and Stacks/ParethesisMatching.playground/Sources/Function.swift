import Foundation

struct Solution {
    
    func getClosingParen(for sentence: String, openingParenIndex: String.Index) -> String.Index? {
        
        // create new stack for tracking parens
        let parenStack = Stack()
        
        // find the starting point based on openingParenIndex
        let startIndex = sentence.distance(from: sentence.startIndex, to: openingParenIndex)
        let endIndex = sentence.count - 1
        var currIndex = startIndex
        
        // loop through string starting at startIndex
        for i in startIndex...endIndex {
            
            let paren = sentence[sentence.index(openingParenIndex, offsetBy: i)]
            if paren == "(" {
                parenStack.push(item: paren)
            } else {
                parenStack.pop()
            }
            
            currIndex += 1
            
            if parenStack.peek() == nil {
                return sentence.index(sentence.startIndex, offsetBy: currIndex)
            }
        }
        
        return nil
    }
}

class Stack {
    
    var items: [Character] = []
    
    func push(item: Character) {
        items.append(item)
    }
    
    func pop() {
        guard !items.isEmpty else { return }
        
        items.removeLast()
    }
    
    func peek() -> Character? {
        return items.last
    }
}

