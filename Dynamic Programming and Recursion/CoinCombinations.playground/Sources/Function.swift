
struct Solution {
        
    func changePossibilities(amount: Int, denominations: [Int]) -> Int {
        
        // storage = [amount: (numOfCombinations, withDenominations)]
        var storage: [Int: (Int, [Int])] = [:]
        
        // memo = ((amount, denominations) -> totalNumOfCombinations)
        var memo: ((Int, [Int]) -> Int)!
        
        // if the amount is 0, return 1 way to make zero
        guard amount > 0 else { return 1 }
        
        memo = { amount, denominations in
            // if the amount has already been calculated with the specified denomination, return the number of combinations
            // O(k)
            if let cached = storage[amount],
               cached.1 == denominations {
                return cached.0
            }
            
            // create a new variable to track the total possible combinations
            var totalCombinations = 0
            
            // iterate the denominations
            // O(k)
            for (i, denomination) in denominations.enumerated() {
                // calculate what the amount would be if the coin was added to the amount
                let currAmount = amount - denomination
                
                // if there is still amount left, recursively call memo with the new amount
                if currAmount > 0 {
                    // add the amount returned from the recursive call to the total number of combinations
                    // send the current amount, and only the coin denomations equal and lower than current coin to avoid repeat combinations
                    // O(n)
                    let updatedDenominations = Array(denominations[...i])
                    totalCombinations += memo(currAmount, updatedDenominations)
                    
                // if the current amount is zero, add one to the total combination count
                } else if currAmount == 0 {
                    totalCombinations += 1
                }
            }
            
            // add the total combinations and current denominations to the storage and return the total combinations
            storage[amount] = (totalCombinations, denominations)
            return totalCombinations
        }

        return memo(amount, denominations)
    }
}


