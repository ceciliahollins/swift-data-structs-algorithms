### Reference
### n = number of denominations
### k = amount

## Recursively attempt combinations and memoize number of combinations at amounts (Top down)
### time complexity: O(n x k)
### space complexity: O(k)

The dynamic programming top down solution uses a recursive function and memoizes results. For the explanation on the recursive solution, see below at **Recursively attempt combinations**. 

We can take this solution one step further by adding memoization. To memoize in Swift, some changes are made to the function to recursively call a closure and store the cache within the function. 

The storage variable is a dictionary where the key is an amount between 0 and the amount, and the value is a tuple, including the number of combinations and an array of the denominations. Both the numOfCombinations and the denominations used needs to be stored in the dictionary, as the denominations are updated for each recursive call.
```swift
// storage = [amount: (numOfCombinations, withDenominations)]
var storage: [Int: (Int, [Int])] = [:]
```

The memo closure is where the algorithm defined in the below recursive solution is executed. Before the algorithm, the storage is checked to see if that amount has already been calculated with a numOfCombinations and the current specific denomination array.
```swift
if let cached = storage[amount],
   cached.1 == denominations {
    return cached.0
}
```
This could speed up the solution by removing repeated executions. If the amount is not in the storage with the matching denomination array, the algorithm is executed and the result is then stored. The closure calls itself to then call and execute amounts. 

The time complexity is the same worse case as the recursive solution below, but has a much better best case scenario. As seen in the code snippet walkthrough in the recursive solution explanation, recursive calls 4 and 6 are repeated. The storage in this example would rid the algorithm of having to repeat this call and instead directly return a result. For the example:
```swift
let amount = 100
let denominations = [1, 5, 10, 25, 50]
```
**The call stack goes from making 7,455 calls to only 159 calls with memoization!** As the input grows, the use of the storage will to allow for better results. While the memoized solution may not directly affect the time complexity, it allows for a much faster execution. 

The space complexity also stays the same as the recursive call, accounting for the call stack. There is also the added space of the storage, increasing the space complexity to O(2k), which becomes O(k)

## Iterate 0 to amount to calculate number of combinations at amounts (Bottom up)
### time complexity: O(n x k)
### space complexity: O(k)

A bottom up solution would find the number of combinations for every single coin amount from 0 to the amount. This differs from the recursive solution, as all amounts are calculated in the loop. In the recursive solution, amounts are iterated based on the denominations. A non working snippet of what this may look like is shown below

```swift
var combinationsAtAmounts: [Int] = Array(repeating: 0, count: amount + 1)
combinationsAtAmounts[0] = 1

for denomination in denominations {
    if denomination <= amount {
        for currAmount in denomination...amount {
            let remainder = currAmount - denomination
            combinationsAtAmounts[currAmount] += combinationsAtAmounts[remainder]
        }
    }
}
```

Time complexity comes to O(n x k) due to the nested loop iterating the denominations in the outer loop and the amount in the inner loop. The space is O(k), and accounts for the array that stores combinations at each capacity.

## Recursively attempt combinations
### time complexity: O(n^k)
### space complexity: O(k)

A recursive approach iterates the denominations and calls itself with an updated amount if the current coin denomination were to be added to the original amount. The call stack will continually add coins to the total and return the number of total combinations for that total. However, the recursive calls need to be done in a way so combinations are not repeated. For example:
```swift
let denominations = [1, 2, 3]
let amount = 4
```
would make recursive calls with the following logic:
```swift
var totalCombinations = 0

for (i, denomination) in denominations.enumerated() {
    let currAmount = amount - denomination
    
    if currAmount > 0 {
        totalCombinations += memo(currAmount, denominations)
    } else if currAmount == 0 {
        totalCombinations += 1
    }
    return totalCombinations
}
```
and would return the combinations:
```swift
[1, 1, 1, 1]
[1, 1, 2]
[1, 2, 1]
[1, 3]
[2, 1, 1]
[2, 2]
[3, 1]
```
The figure below illustrates how the coins would be added in the recursive solution.
[Figure 0](/figure-0.png)

Without additional logic to avoid repeated combinations, an incorrect answer will be returned. The repeated combinations can be seen by the highlighted markup.
[Figure 1](/figure-1.png)

In order to avoid this, the first solution that comes to mind would be to add additional space to store the current combinations, and compare the current combination to the already found combinations. This would require O(n^k) extra space to store combinations, and at least O(klogk + k(n^k)) to sort the current combination array where worst case is the array is the size of the amount (klogk), and compare it (k) with every other array in the storage (n^k). This is highly inefficient.

The smarter solution is to update the coin denomination input for each recursive call, so as not to even make repition possible. While iterating the denominations, the next recursive call should only pass denominations that are the same amount or smaller than the current denomination. The updated logic would now be:
```swift
var totalCombinations = 0

for (i, denomination) in denominations.enumerated() {
    let currAmount = amount - denomination
    
    if currAmount > 0 {
        let updatedDenominations = Array(denominations[...i])
        totalCombinations += memo(currAmount, updatedDenominations)
    } else if currAmount == 0 {
        totalCombinations += 1
    }
    return totalCombinations
}
```
The new recursive solution can be illustrated as following:
[Figure 2](/figure-2.png)

For more understanding, a code walkthrough can be provided. With the solution, the call stack starts with amount 4 and denominations 1, 2, and 3. the denominations are iterated, and the current denomination is subtracted from the current amount. if that amount is greater than zero, a recursive call is make with the new amount and updated denominations, taking only the denominations that are the same amount or less to avoid repeat combinations. The total returned will be added to the total combinations amount. If the new amount is zero, one is added to the total combinations, as it will be one full combination. If the amount is less than zero, nothing should be done as this is not a valid combination. In depth iterations are shown below:

```swift
(call 1)
changePossibilities(4, denominations: [1, 2, 3])
totalCombinations = 0
Iteration 1:
    denomination = 1
    currAmount = 4 - 1 = 3
    currAmount > 0 = true
    updatedDenominations = denominations[...0] = [1]
    totalCombinations = changePossibilities(3, [1])
    
(call 2)
changePossibilities(3, denominations: [1])
totalCombinations = 0
Iteration 1:
    denomination = 1
    currAmount = 3 - 1 = 2
    currAmount > 0 = true
    updatedDenominations = denominations[...0] = [1]
    totalCombinations = changePossibilities(2, [1])
    
(call 3)
changePossibilities(2, denominations: [1])
totalCombinations = 0
Iteration 1:
    denomination = 1
    currAmount = 2 - 1 = 1
    currAmount > 0 = true
    updatedDenominations = denominations[...0] = [1]
    totalCombinations = changePossibilities(1, [1])
    
(call 4)
changePossibilities(1, denominations: [1])
totalCombinations = 0
Iteration 1:
    denomination = 1
    currAmount = 1 - 1 = 0
    currAmount == 0 = true
    totalCombinations = 1
** return 1 to changePossibilities(2, denominations: [1]) **

(call 3)
Iteration 1:
    totalCombinations = changePossibilities(1, [1]) = 1
** return 1 to changePossibilities(3, denominations: [1]) **

(call 2)
Iteration 1:
    totalCombinations = changePossibilities(2, [1]) = 1
** return 1 to changePossibilities(4, denominations: [1, 2, 3]) **

(call 1)
Iteration 1:
    totalCombinations = changePossibilities(3, [1]) = 1
Iteration 2:
    denomination = 2
    currAmount = 4 - 2 = 2
    currAmount > 0 = true
    updatedDenominations = denominations[...1] = [1, 2]
    totalCombinations = changePossibilities(2, [1, 2])
    
(call 5)
changePossibilities(2, denominations: [1, 2])
totalCombinations = 0
Iteration 1:
    denomination = 1
    currAmount = 2 - 1 = 1
    currAmount > 0 = true
    updatedDenominations = denominations[...1] = [1]
    totalCombinations = changePossibilities(1, [1])

(call 6)
changePossibilities(1, denominations: [1])
totalCombinations = 0
Iteration 1:
    denomination = 1
    currAmount = 1 - 1 = 0
    currAmount == 0 = true
    totalCombinations = 1
** return 1 to changePossibilities(2, denominations: [1, 2]) **

(call 5)
Iteration 1:
    totalCombinations = changePossibilities(1, [1]) = 1
Iteration 2:
    denomination = 2
    currAmount = 2 - 2 = 0
    currAmount == 0 = true
    totalCombinations = 1 + 1 = 2
** return 2 to changePossibilities(4, denominations: [1, 2, 3]) **

(call 1)
Iteration 2:
    totalCombinations = 1 + changePossibilities(2, [1, 2]) = 1 + 2 = 3
Iteration 3:
    denomination = 3
    currAmount = 4 - 3 = 1
    currAmount > 0 = true
    updatedDenominations = denominations[...2] = [1, 2, 3]
    totalCombinations = changePossibilities(1, [1, 2, 3])
    
(call 7)
changePossibilities(1, denominations: [1, 2, 3])
totalCombinations = 0
Iteration 1:
    denomination = 1
    currAmount = 1 - 1 = 0
    currAmount == 0 = true
    totalCombinations = 1
Iteration 2:
    denomination = 2
    currAmount = -1
Iteration 3:
    denomination = 3
    currAmount = -2
** return 1 to changePossibilities(4, denominations: [1, 2, 3]) **

(call 1)
Iteration 3:
    totalCombinations = 3 + changePossibilities(1, [1, 2, 3]) = 3 + 1 = 4
** return 4 **
```

The time complexity of this recursive based algorithm is O(n^k). The function could call itself for every denomination (n), and there could be up to the total amount return statements (k). One of the main issues with this time complexity is the potential repitition of calls. In this example, call 4 and call 6 are the same. This could cause huge unecessary additions to the call stack.

The space complexity is O(k), as the call stack will take the depth of the recusive stack. As discussed, the depth is the amount (k). While it is unlikely the call stack would reach a depth of k, it is the worst case scenario. 


## Attempt every combination of coins
### time complexity: O(n!)
### space complexity: O(n!)

Brute force solution would be creating every possible combintation of denominations and finding the combinations that would equal the amount, then returning the largest of those values. This is an extremely inefficient solution, as permutation algorithms would need to be utilized.
