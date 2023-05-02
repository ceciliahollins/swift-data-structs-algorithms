### Reference
### n = size of cakeTypes
### k = weightCapacity

## Recursively attempt combinations and memoize best values at weight capacities (Top down)
### time complexity: O(n x k)
### space complexity: O(k)

The dynamic programming top down solution uses a recursive function and memoizes results. For the explanation on the recursive solution, see below at **Recursively attempt combinations**. 

We can take this solution one step further by adding memoization. To memoize in Swift, some changes are made to the function to recursively call a closure and store the cache within the function. 

The storage variable is a dictionary where the key is a weight amount between 0 and the weight capacity, and the value is the best possible monetary value for that weight amount. 
```swift
// storage = [weight: best value]
var storage: [Int: Int] = [:]
```

The memo closure is where the algorithm defined in the below recursive solution is executed. Before the algorithm, the storage is checked to see if that weight capacity has already been calculated with a best monetary value. 
```swift
if let cached = storage[weightCapacity] {
    return cached
}
```
This could speed up the solution by removing repeated executions. If the weight is not in the storage, the algorithm is executed and the result is then stored. The closure calls itself to then call and execute weight capacities. 

The time complexity is the same worse case as the recursive solution below, but has a much better best case scenario. As seen in the code snippet, recursive calls 4 and 6 are repeated. The storage in this example would rid the algorithm of having to repeat this call and instead directly return a result. For the example:
```swift
let cakeTypes = [
    CakeType(weight: 2, value: 3),
    CakeType(weight: 3, value: 6),
    CakeType(weight: 5, value: 1),
    CakeType(weight: 6, value: 1),
    CakeType(weight: 7, value: 1),
    CakeType(weight: 8, value: 1)
]

let capacity = 12
```
The cache is accessed in half of the recursive calls! As the input grows, the use of the storage will to allow for better results. While the memoized solution may not directly affect the time complexity, it allows for a much faster execution. 

The space complexity also stays the same as the recursive call, accounting for the call stack. There is also the added space of the storage, increasing the space complexity to O(2k), which becomes O(k)


## Iterate 0 to weight capacity to calculate highest values at each capacity (Bottom up)
### time complexity: O(n x k)
### space complexity: O(k)

A bottom up solution would find the largest monetary value for every single weight amount from 0 to the weight capacity This differs from the recursive solution, as all weights are calculated in the loop. In the recursive solution, weights are iterated based on the cake weights. A non working snippet of what this may look like is shown below

```swift
var maxValuesAtCapacities: [Int] = Array(repeating: 0, count: weightCapacity + 1)

for currentCapacity in 0...weightCapacity {
    var largestMonetaryValue = 0
    
    for cakeType in cakeTypes {
        let newValue = cakeType.value + maxValuesAtCapacities[currentCapacity - cakeType.weight]
        largestMonetaryValue = max(maxValueUsingCake, currentMaxValue)
    }
}
```

Time complexity comes to O(n x k) due to the nested loop iterating the weight capacity in the outer loop and the cake types in the inner loop. The space is O(k), and accounts for the array that stores best values at each capacity.


## Recursively attempt combinations
### time complexity: O(n^k)
### space complexity: O(k)

A recursive approach iterates the cakes and calls itself with an updated capacity and value if the current cake were to be added to the bag. The call stack will continually add cakes into the bag and return the option that has the highest value. For example:
```swift
let cakeTypes = [
    CakeType(weight: 4, value: 4),
    CakeType(weight: 5, value: 5)
]

let capacity = 9
```
would begin the call stack with capacity 9. In that call, the cakes are iterated and added to the bag. If there is adequate space for the cake to be added, the recursive call is made with the new capacity to find the best possible value if that cake is added. A walk-through of the iterations are shown below:

```swift
(call 1)
maxDuffelBagValue(9)
largestMonetraryValue = 0
Iteration 1:
    cake = (weight: 4, value: 4)
    newCapacity = 5
    newValue = maxDuffelBagValue(5)

(call 2)
maxDuffelBagValue(5)
largestMonetraryValue = 0
Iteration 1:
    cake = (weight: 4, value: 4)
    newCapacity = 1
    newValue = maxDuffelBagValue(1) + 4
  
(call 3)
maxDuffelBagValue(1)
largestMonetraryValue = 0
Iteration 1:
    cake = (weight: 4, value: 4)
    newCapacity = -3
Iteration 2:
    cake = (weight: 5, value: 5)
    newCapacity = -4
** return 0 to maxDuffelBagValue(5) **

(call 2)
maxDuffelBagValue(5) cont.
Iteration 1:
    newValue = 0 + 4 = 4
largestMonetaryValue = 4
Iteration 2:
    cake = (weight: 5, value: 5)
    newCapacity = 0
    newValue = maxDuffelBagValue(0) + 5
  
(call 4)
maxDuffelBagValue(0)
largestMonetraryValue = 0
Iteration 1:
    cake = (weight: 4, value: 4)
    newCapacity = -4
Iteration 2:
    cake = (weight: 5, value: 5)
    newCapacity = -5
** return 0 to maxDuffelBagValue(5) **

(call 2)
maxDuffelBagValue(5) cont.
Iteration 2:
    newValue = 0 + 5 = 5
largestMonetaryValue = 5
** return 5 to maxDuffelBagValue(9) **

(call 1)
maxDuffelBagValue(9) cont.
Iteration 1:
    newValue = 5 + 4 = 9
largestMonetaryValue = 9
Iteration 2:
    cake = (weight: 5, value: 5)
    newCapacity = 4
    newValue = memo(4) + 5

(call 5)
maxDuffelBagValue(4)
largestMonetraryValue = 0
Iteration 1:
    cake = (weight: 4, value: 4)
    newCapacity = 0
    newValue = maxDuffelBagValue(0) + 4

(call 6)
maxDuffelBagValue(0)
largestMonetraryValue = 0
Iteration 1:
    cake = (weight: 4, value: 4)
    newCapacity = -4
Iteration 2:
    cake = (weight: 5, value: 5)
    newCapacity = -5
** return 0 to maxDuffelBagValue(4) **

(call 5)
maxDuffelBagValue(4) cont.
Iteration 1:
    newValue = 0 + 4 = 4
largestMonetraryValue = 4
Iteration 2:
    cake = (weight: 5, value: 5)
    newCapacity = -1
** return 4 to maxDuffelBagValue(9) **

(call 1)
maxDuffelBagValue(9) cont.
Iteration 2:
    newValue = 4 + 5 = 9
largestMonetaryValue = 9
** return 9 **
```

The time complexity of this recursive based algorithm is O(n^k). The function could call itself for every cakeType (n), and there could be up to the weigthCapacity return statements (k). One of the main issues with this time complexity is the potential repitition of calls. In this example, call 4 and call 6 are the same. This could call huge unecessary additions to the call stack.

The space complexity is O(k), as the call stack will take the depth of the recusive stack. As discussed, the depth is the weightCapacity (k). While it is unlikely the call stack would reach a depth of k, it is the worst case scenario. 


## Greedily select high value items (will not produce correct solution)
### time complexity: O(n x k)
### space complexity: O(k)

While a greedy algorithm will not output a correct solution, it is important to acknowledge for learning purposes. A greedy algorithm would iterate the sorted array adding cakes with the highest value until the bag is full. While this may work for some tests, it will not be true for all. For example:
```swift
let cakeTypes = [
    CakeType(weight: 5, value: 1),
    CakeType(weight: 10, value: 2),
    CakeType(weight: 20, value: 3)
]

let capacity = 30
```
Would first take the cake of weight 20 and add it to the bag for a value of 3, then add the cake of weight 20 and add it to the bag for a total value of 5. However, the bag could also hold 6 cakes of weight 5 for a total value of 6. Because of cases like this one, it is not viable to use a greedy algorithm for this problem.


## Attempt every combination of cakes
### time complexity: O(n!)
### space complexity: O(n!)

Brute force solution would be creating every possible combintation of cakes and finding the combinations that would be under the weight capacity, then returning the largest of those values. This is an extremely inefficient solution, as permutation algorithms would need to be utilized.
