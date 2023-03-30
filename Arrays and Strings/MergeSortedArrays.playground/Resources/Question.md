# Merge Sorted Arrays
Source: [Interview Cake](https://www.interviewcake.com/question/swift/merge-sorted-arrays?course=fc1&section=array-and-string-manipulation)

## In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.

Each order is represented by an "order id" (an integer).

We have our lists of orders sorted numerically already, in arrays. Write a function to merge our arrays of orders into one sorted array.

For example:
```swift
let myArray = [3, 4, 6, 10, 11, 15]
let alicesArray = [1, 5, 8, 12, 14, 19]

print(mergeArrays(myArray, alicesArray))
// prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
```
