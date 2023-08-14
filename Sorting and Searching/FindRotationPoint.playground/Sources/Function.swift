import Foundation

struct Solution {
    
    func findRotationPoint(in words: [String]) -> Int {

        // if the array is empty, return -1
        guard !words.isEmpty else { return -1 }

        // create a lower wall and an upper wall to search in between
        var lowerWall = 0
        var upperWall = words.count - 1
        // find the middle point
        var middle = (upperWall - lowerWall) / 2
        
        // until the lower wall hits the upper wall, continue to search
        while lowerWall < upperWall {
            
            // if the word at the middle is greater than the next word after middle, the rotation point has been found
            if words[middle] > words[middle + 1] {
                return middle + 1
                
            // if the word at the lower wall is greater that the word at the middle, the rotation point is in the lower half, move the upper wall to search the lower half
            } else if words[lowerWall] > words[middle] {
                upperWall = middle
                
            // otherwise, the rotation point is in the upper half, move the lower wall to search the upper half
            } else {
                lowerWall = middle
            }
            
            // update the new middle point of the lower and upper wall
            middle = lowerWall + ((upperWall - lowerWall) / 2)
        }
        
        // the lower wall has hit the upper wall, return the last possible solution
        return middle
    }
}

