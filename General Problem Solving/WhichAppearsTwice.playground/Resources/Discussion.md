## Take advantage of constraints and use math
### time complexity: O(n)
### space complexity: O(1)

There are key constraints on the data set that allows us to use maths to bring down the time and space complexity.
* Range of numbers are 1..n
* One number appears twice
* Every other number appears once

Because of these strict constraints, maths can be used to solve for the duplicate number. The expected total of all numbers in the array added together can be compared to the actual total. A formula can be used to calculate the expected total, and an array to iterate the array is used to calculate the actual total value. When the expected value is subtracted from the total value, the duplicate number is found. For example:
```swift
var array = [1, 2, 2, 3]

var expectedTotalValue = ((3 * 3) + 3) / 2 = 6
var actualTotalValue = 1 + 2 + 2 + 3 = 8

return 8 - 6 = 2
```

This solution brings the space complexity down to O(1) as compared to solutions below, and keeps the best possible time complexity of O(n).

## Create a set, iterate array and add items to set, return when duplicate is found
### time complexity: O(n)
### space complexity: O(n)

By using a set to track numbers, time complexity can be brought down to O(n). A set in swift is a hash map with only a key, meaning access and additions of the set is O(1) time. When a number is encountered during the loop, it is added to the set. If a number is attempted to be added but is already added, the duplicate is found. The methods used on the set are .contains(id) and .insert(id), both O(1) time complexity. 

```swift
var duplicateLog: Set<Int> = []

for num in array {
    if duplicateLog.contains(num) {
        return num
    } else {
        duplicateLog.insert(num)
    }
}

return 0
```

Worse case is every number is the array is added to the set, meaning the time and space complexity must be at least O(n). Best case is the duplicate is found early and the algoritm does not need to continue. While this is an improvement compared to solutions below, there are constraints added in the problem statement that are not currently being taken advantage of. This means the solution can be improved.

## Sort array and iterate items
### time complexity: O(nlogn + n)
### space complexity: O(n)

This solution would first sort the array using a basic nlogn sorting algorithm, then iterate through the array to track which values do not have a duplicate. The code solution is outlined below.

```swift
let sortedArray = array.sorted()
var i = 0
while i < sortedArray.count - 2 {
    if sortedArray[i] == sortedArray[i+1] {
        return sortedArray[i]
    }
    i += 1
}

return sortedArray.last ?? 0
```

The time complexity for this solution is O(nlogn + n) accounting for the sorting O(nlogn), and iterating for duplicates O(n). The space of O(n) accounts for the added space of the sortedArray variable. While this is better than brute force, it is possible to do better.

## Brute force: nested loop to search entire array
### time complexity: O(n^2)
### space complexity: O(1)

The brute force solution would involve creating a nested for loop that compares every item with every other item in the array to check if the ID has a duplicate. Worse case time for this solution is O(n^2) and should not be used.
