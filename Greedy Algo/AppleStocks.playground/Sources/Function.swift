import Foundation

struct Solution {
    
    func getMaxProfit(from stockPricesYesterday: [Int]) -> Int? {
        
        guard stockPricesYesterday.count > 1 else { return nil }
        
        var minPrice = stockPricesYesterday[0]
        var maxProfit = stockPricesYesterday[1] - stockPricesYesterday[0]
        
        for currPrice in stockPricesYesterday[1...] {
            let potentialProfit = currPrice - minPrice
            maxProfit = max(maxProfit, potentialProfit)
            minPrice = min(minPrice, currPrice)
        }
        
        
        return maxProfit
    }
}

