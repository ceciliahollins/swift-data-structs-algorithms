import Foundation

struct Solution {
    
    func isValid(code: String) -> Bool {
        
        let stack = Stack()
        
        for paren in code {
            if paren.isOpeningParenthesis() {
                stack.push(paren)
            } else {
                if paren.parenthesisMatch(stack.peek()) {
                    stack.pop()
                } else {
                    return false
                }
            }
        }
        
        return stack.isEmpty()
    }
}

class Stack {
    
    var items: [Character] = []
    
    func push(_ item: Character) {
        items.append(item)
    }
    
    func pop() {
        guard !items.isEmpty else { return }
        items.removeLast()
    }
    
    func peek() -> Character? {
        return items.last
    }
    
    func count() -> Int {
        return items.count
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}

extension Character {
    func isOpeningParenthesis() -> Bool {
        return self == "(" || self == "{" || self == "["
    }
    
    func parenthesisMatch(_ compare: Character?) -> Bool {
        guard let compare = compare else { return false }
        
        return (compare == "(" && self == ")")
        || (compare == "{" && self == "}")
        || (compare == "[" && self == "]")
        || (self == "(" && compare == ")")
        || (self == "{" && compare == "}")
        || (self == "[" && compare == "]")
    }
}

