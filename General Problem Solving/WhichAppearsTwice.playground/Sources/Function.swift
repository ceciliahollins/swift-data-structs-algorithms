import Foundation

struct Solution {
    
    func findRepeat(in array: [Int]) -> Int {

        // pull value of n into a variable
        let n = array.count - 1
        
        // calculate the expected total value given constraints
        // this is a formula for adding all numbers together between 0..n
        let expectedTotalValue = ((n*n) + n) / 2
        
        // iterate the array to calculate the actual expected value
        var actualTotalValue = 0
        for item in array {
            actualTotalValue += item
        }


        // subtract the expected total value from the actual, this will be the duplicate number
        return actualTotalValue - expectedTotalValue
    }
}

