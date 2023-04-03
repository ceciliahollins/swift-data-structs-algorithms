import Foundation

struct Solution {
    
    func reverse(_ str: inout [Character]) {

        // iterate input, stopping halfway through
        for currIndex in 0 ..< str.count/2 {
            
            // get the mirrored index
            let oppositeIndex = str.count - (currIndex + 1)
            
            // swap the mirrored values
            let tempElement = str[currIndex]
            str[currIndex] = str[oppositeIndex]
            str[oppositeIndex] = tempElement
        }
    }
}

