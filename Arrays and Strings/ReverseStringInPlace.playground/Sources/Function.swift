import Foundation

struct Solution {
    
    func reverse(_ str: inout [Character]) {

        for i in 0 ..< str.count/2 {
            let lastIndex = str.count - (i + 1)
            
            let tempElement = str[i]
            str[i] = str[lastIndex]
            str[lastIndex] = tempElement
        }
        
        // time complexity: O(n)
        // space complexity O(1)
    }
}

