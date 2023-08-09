import Foundation

class Solution {
    
    func fib(_ n: Int) -> Int {
        
        // create a storage variable to hold the cache of results
        // storage = [fibNum: value]
        var storage: [Int: Int] = [:]
        
        // create a memo function to be recursively called
        // memo = ((fibNum) -> value)
        var memo: ((Int) -> Int)!
        
        // add the memoized fibonacci algorithm into the memo closure
        memo = { n in
            
            // if the input is already in storage, return the value
            if let storage = storage[n] { return storage }

            // calculate the fib number by recursively calling memo
            let result = n <= 1 ? n : memo(n-1) + memo(n-2)
            // add the result to the storage
            storage[n] = result
            // return the result
            return result
        }

        // call memo with the fib input n and return the result
        return memo(n)
    }
}

