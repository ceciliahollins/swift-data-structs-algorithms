import Foundation

struct Solution {
    
    func getMaxProfit(from stockPricesYesterday: [Int]) -> Int? {
        
        // ensure the array had more than 1 price
        guard stockPricesYesterday.count > 1 else { return nil }
        
        // create two variables to track the current best minimum price to buy and the current maximum profit
        // default to the first price of the day and the difference between the first and second price
        var currMinPriceToBuy = stockPricesYesterday[0]
        var currMaxProfit = stockPricesYesterday[1] - stockPricesYesterday[0]
        
        // iterate the day, starting at the second price since first day has already been defaulted
        for currPrice in stockPricesYesterday[1...] {
            
            // calculate the potential profit if the current minimum price of the day was bought and the price at this minute was sold
            let potentialProfit = currPrice - currMinPriceToBuy
            
            // update the current max profit if the potential profit is higher than the current maximum profit
            currMaxProfit = max(currMaxProfit, potentialProfit)
            // update the current minimum price if the price at this minute is lower than the current minimum price
            currMinPriceToBuy = min(currMinPriceToBuy, currPrice)
        }
        
        return currMaxProfit
    }
}

