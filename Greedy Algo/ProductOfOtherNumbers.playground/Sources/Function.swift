import Foundation

struct Solution {
    
    func getProductsOfAllIntsExceptAtIndex(_ ints: [Int]) -> [Int]? {

        // guard inputs that have only one element
        guard ints.count > 1 else { return nil }
        
        // create a new array for the output, the same length as the input
        var products: [Int] = Array(repeating: 0, count: ints.count)

        // find the product of the values to the left of each index
        // create a variable to track the product total during the loop
        var currProducts = 1
        for i in 0..<ints.count {
            // assign the currProduct to the current index of the output array
            products[i] = currProducts
            // update the currProducts to include the current index of the input array
            currProducts *= ints[i]
        }
        
        // find the product of the values to the right of each index
        // do this by reversing the input array
        // reset the currProducts value
        currProducts = 1
        for i in  (0..<ints.count).reversed() {
            // update the value of the current index of the output array to multiply the currProduct by itself
            products[i] *= currProducts
            // update the currProducts to include the current index of the input array
            currProducts *= ints[i]
        }
        
        // return the final output array
        return products
    }
}

