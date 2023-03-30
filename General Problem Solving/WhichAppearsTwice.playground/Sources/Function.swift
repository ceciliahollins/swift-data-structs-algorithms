import Foundation

struct Solution {
    
    func findRepeat(in array: [Int]) -> Int? {

        let n = array.count - 1
        
        let expectedTriangleValue = ((n*n) + n) / 2
        var actualTrianlgeValue = 0
        for item in array {
            actualTrianlgeValue += item
        }


        return actualTrianlgeValue - expectedTriangleValue
    }
}

