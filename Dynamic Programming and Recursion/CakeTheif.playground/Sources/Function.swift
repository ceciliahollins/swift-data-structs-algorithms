import Foundation

public struct CakeType {
    let weight: Int
    let value: Int
}

// memo = [weight: best value]
public func maxDuffelBagValue(for cakeTypes: [CakeType], withCapacity weightCapacity: Int, memo: [Int: Int] = [:]) -> Int {
        
    // check if weight capacity is already in memo
    if let memo = memo[weightCapacity] {
        print("Hit", memo)
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
    
    print(weightCapacity, largestResult)
    memo[weightCapacity] = largestResult
    return largestResult
}

