import Foundation

class Solution {
    var memo: [Int: Int] = [:]

    // memo = [fibNum: value]
    func fib(_ n: Int) -> Int {

        if let memo = memo[n] { return memo }

        // base cases
        if n <= 1 {
            return n
        }
        
        memo[n] = fib(n-1) + fib(n-2)
        return memo[n]!
    }
}

