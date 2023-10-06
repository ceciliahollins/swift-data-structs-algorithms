## Greedy algo: track lowest price to buy
### time complexity: O(n)
### space complexity: O(1)

This problem is able to utilize a greedy algorithm to improve time and space complexity because of some characteristics of the problem statement. First, the solution can be computed in a serial forward fashion, and it does not need to look back at the dataset or revise previous choices. The day is iterated from start to finish, and it is not needed to revisit any parts of the day to get an accurate solution. It makes the best choice in that moment by tracking the lowest price to buy and selling it when the difference between the low price and current price is highest.

The solution involves creating two constant variables, one to track the minimum price for buying and the maximum possible profit. These values are defaulted to the first price of the day as the minimum price, and the difference between the second and first price for the maximum profit. 

The day is then iterated, starting at the second price of the day as the first day has already been defaulted in the variables. The potential profit is calculate if the lowest price was bought and is sold at the current price. The current maximum profit is updated if the potential profit is higher than the current maximum profit. The current minimum price is also updated if the current price is lower than the current minimum price. Once the entire day has been iterated, the current maximum profit is returned. An example test case is shown below:

```swift
stockPricesYesterday = [2, 10, 1, 4]
currMinPriceToBuy = stockPricesYesterday[0] = 2
currMaxProfit = stockPricesYesterday[1] - stockPricesYesterday[0] = 10 - 2 = 8

ITERATION 1
currPrice = 10
potentialProfit = 10 - 2 = 8
currMaxProfit = max(8, 8) = 8
currMinPriceToBuy = min(2, 10) = 2

ITERATION 2
currPrice = 1
potentialProfit = 1 - 2 = -1
currMaxProfit = max(8, -1) = 8
currMinPriceToBuy = min(2, 1) = 1

ITERATION 3
currPrice = 4
potentialProfit = 4 - 1 = 3
currMaxProfit = max(8, 3) = 8
currMinPriceToBuy = min(1, 4) = 1

return 8
```

The time complexity for this solution is O(n), as the entire day is being iterated to find the maximum profit. This time cannot be brought down, as the whole day will always need to be inspected. The space complexity is O(1), as there are only constant variables added. Even though a greedy algorithm is being used, it can be ensured the optimal solution will always be found because solution does not need to revise on previous choices in the algorithm, and there are no subproblems within this problem to solve. The greedy algorithm allows for our time and space complexity to be brought down this low.

## Find min and max price to return maximum profit
### time complexity: Average O(n), worse O(n^2)
### space complexity: O(1)

The easiest solution seems to be using built in methods min() and max() to find the minimum and maximum price during the day to calculate the maximum profit. These methods are both O(n) time complexity, resulting in O(2n), or O(n), overall time. This solution seems optimal, but could not return correct solutions if the constraints in the problem statement are not correctly dealt with. The problem states "No "shorting" — you need to buy before you can sell", as well as "you can't buy and sell in the same time step".

Because of this constraint, extra checks would need to be completed to ensure the minimum price found is earlier in the day compared to the maximum price found. If this is not true, a new min and max value would need to be found. This makes the algorithm far more complex, and brings the worse case scenario to O(n^2) time complexity. Because of this, it should not be used as a final solution.

## Brute force: nested loop to compare prices
### time complexity: O(n^2)
### space complexity: O(1)

The brute force solution would be a nested loop to iterate and compare prices to find the highest profit. Worse case time for this solution is O(n^2) and should not be used.
