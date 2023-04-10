import Foundation

struct Solution {
    
    func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {
        
        // variables to track the indices of the expected next take out and dine in orders
        // if the array is empty, set the index as -1
        var expectedNextTakeOut = takeOutOrders.isEmpty ? -1 : 0
        var expectedNextDineIn = dineInOrders.isEmpty ? -1 : 0
        
        // iterate through the served orders
        for currServedOrder in servedOrders {
            
            // check if the current served order is the next expected take out order
            if expectedNextTakeOut != -1
                && currServedOrder == takeOutOrders[expectedNextTakeOut] {
                
                // if the take out orders are finished, set the index to -1
                // otherwise, increase the index by 1
                expectedNextTakeOut = expectedNextTakeOut == takeOutOrders.count - 1
                ? -1
                : expectedNextTakeOut + 1
                
            // check if the current served order is the next expected dine in order
            } else if expectedNextDineIn != -1
                        && currServedOrder == dineInOrders[expectedNextDineIn] {
                
                // if the dine in orders are finished, set the index to -1
                // otherwise, increase the index by 1
                expectedNextDineIn = expectedNextDineIn == dineInOrders.count - 1
                ? -1
                : expectedNextDineIn + 1
                
            } else {
                // there are no more expected take out or dine in orders and still served orders in the list,
                // or the current served order does not match the next expected orders
                return false
            }
        }
        
        // check there are no more take out or dine in orders expecting to be served
        guard expectedNextTakeOut == -1 && expectedNextDineIn == -1 else { return false }
        
        return true
    }
}

