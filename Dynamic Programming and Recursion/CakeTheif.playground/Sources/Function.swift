import Foundation

struct CakeType {
    let weight: Int
    let value: Int
}

class Solution {
    
    func maxDuffelBagValue(for cakeTypes: [CakeType], withCapacity weightCapacity: Int) -> Int {
        // storage = [weight: best value]
        var storage: [Int: Int] = [:]
        
        // memo = ((cakeTypes, weightCapacity) -> bestValue)
        var memo: (([CakeType], Int) -> Int)!
        
        memo = { cakeTypes, weightCapacity in
            
            // check if this weight capacity has already been calculated in the storage
            if let cached = storage[weightCapacity] {
                return cached
            }
                
            // check possible combinations for each cake type
            var largestMonetaryValue = 0
            for cake in cakeTypes {
                
                guard cake.weight != 0 else { continue }
                
                // calculate the new capacity available if the current cake is added to the bag
                let newCapacity = weightCapacity - cake.weight
                
                // as long as the new capacity available is above 0, the cake can be added to the bag
                if newCapacity >= 0 {
                    
                    // recursively call the function to calculate the best value if the current cake is added into the bag
                    let newValue = memo(cakeTypes, newCapacity)
                    
                    // take the largest value from testing possibilities for the current weigh capacity
                    largestMonetaryValue = max(cake.value + newValue, largestMonetaryValue)
                }
            }
            
            // add the largest monetary value for that weight to the storage for later recursion calls
            storage[weightCapacity] = largestMonetaryValue
            return largestMonetaryValue
        }
        
        return memo(cakeTypes, weightCapacity)
    }
}

