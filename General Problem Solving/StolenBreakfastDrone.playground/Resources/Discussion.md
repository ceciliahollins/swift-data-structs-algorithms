## Create a set, add items at takeoff and remove items at land, return last id in set
### time complexity: O(n)
### space complexity: O(n)

By using a set to track deliveries, time complexity can be brought down to O(n). A set in swift is a hash map with only a key, meaning access and edits of the set is O(1) time. When a drone takes off, its ID is added to the set. When the drone lands, its ID is removed from the set. The methods used on the set are .contains(id), .insert(id), and .remove(id), all O(1) time complexity. 

Every id must be iterated to check for takeoff and landing, meaning the time complexity must be at least O(n). At worse case, the space complexity will be O(n) to account for the space of the set, but the space will be removed by the end of the algorithm. Becuase there are no constraints on the ID's, the space must be used to track ID's. If drone ID's were constrained to be between 0 and n-1, maths could be used to bring the space down to O(1). However, because the problem statement says 'Each breakfast delivery is assigned a unique ID, a positive integer', this cannot be done. 

## Sort array and iterate items
### time complexity: O(nlogn + n)
### space complexity: O(n)

This solution would first sort the array using a basic nlogn sorting algorithm, then iterate through the array to track which values do not have a duplicate. The code solution is outlined below.

```swift
guard deliveryIds.count > 1 else { return deliveryIds.first ?? 0 }

let sortedDeliveries = deliveryIds.sorted()
var i = 0
while i < sortedDeliveries.count - 1 {
    if sortedDeliveries[i] != sortedDeliveries[i+1] {
        return sortedDeliveries[i]
    }
    i += 2
}

return sortedDeliveries.last ?? 0
```

The time complexity for this solution is O(nlogn + n) accounting for the sorting O(nlogn), and iterating for duplicates O(n). The space of O(n) accounts for the added space of the sortedDeliveries variable. While this is better than brute force, it is possible to do better.

## Brute force: nested loop to search entire array
### time complexity: O(n^2)
### space complexity: O(1)

The brute force solution would involve creating a nested for loop that compares every item with every other item in the array to check if the ID has a duplicate. Worse case time for this solution is O(n^2) and should not be used.
