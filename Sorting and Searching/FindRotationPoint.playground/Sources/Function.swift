import Foundation

struct Solution {
    
    func findRotationPoint(in words: [String]) -> Int {

        guard !words.isEmpty else { return -1 }

        var lowerWall = 0
        var upperWall = words.count - 1
        var middle = (upperWall - lowerWall) / 2
        
        while lowerWall < upperWall {
            if words[middle] > words[middle + 1] {
                return middle + 1
            } else if words[lowerWall] > words[middle] {
                upperWall = middle
            } else {
                lowerWall = middle
            }
            middle = lowerWall + ((upperWall - lowerWall) / 2)
        }
        
        return middle
    }
}

