import Foundation

struct Solution {
    
    func getProductsOfAllIntsExceptAtIndex(_ ints: [Int]) -> [Int]? {

        guard ints.count > 1 else { return nil }
        
        var products: [Int] = Array(repeating: 0, count: ints.count)

        var currProducts = 1
        for i in 0..<ints.count {
            products[i] = currProducts
            currProducts *= ints[i]
        }
        
        currProducts = 1
        for i in  (0..<ints.count).reversed() {
            products[i] *= currProducts
            currProducts *= ints[i]
        }
        
        return products
    }
}

