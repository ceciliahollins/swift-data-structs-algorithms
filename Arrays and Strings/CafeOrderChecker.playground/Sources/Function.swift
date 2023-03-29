import Foundation

struct Solution {
    
    func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {
        
        var expectedNextTakeOut = takeOutOrders.isEmpty ? -1 : 0
        var expectedNextDineIn = dineInOrders.isEmpty ? -1 : 0
        
        for order in servedOrders {
            if expectedNextTakeOut != -1
                && order == takeOutOrders[expectedNextTakeOut] {
                
                expectedNextTakeOut = expectedNextTakeOut == takeOutOrders.count - 1
                ? -1
                : expectedNextTakeOut + 1
                
            } else if expectedNextDineIn != -1
                        && order == dineInOrders[expectedNextDineIn] {
                
                expectedNextDineIn = expectedNextDineIn == dineInOrders.count - 1
                ? -1
                : expectedNextDineIn + 1
                
            } else {
                return false
            }
        }
        
        guard expectedNextTakeOut == -1 && expectedNextDineIn == -1 else { return false }
        
        return true
    }
}

