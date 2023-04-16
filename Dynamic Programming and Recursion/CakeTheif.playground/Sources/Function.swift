import Foundation

struct CakeType {
    let weight: Int
    let value: Int
}

class Solution {
    
    // memo = [weight: best value]
    var memo: [Int: Int] = [:]
    
    func maxDuffelBagValue(for cakeTypes: [CakeType], withCapacity weightCapacity: Int) -> Int {
            
        // check if weight capacity is already in memo
        if let memo = memo[weightCapacity] {
            return memo
        }
        
        // Base case
        if weightCapacity <= 0 {
            return 0
        }
        
        var largestResult = 0
            
        // Check possibilities for each cake
        for cake in cakeTypes {
            guard cake.weight != 0 else { continue }
            
            let newCapacity = weightCapacity - cake.weight
            let newValue = maxDuffelBagValue(for: cakeTypes, withCapacity: newCapacity)
            
            if newCapacity >= 0 {
                largestResult = max(cake.value + newValue, largestResult)
            }
        }
        
        memo[weightCapacity] = largestResult
        return largestResult
    }
}

