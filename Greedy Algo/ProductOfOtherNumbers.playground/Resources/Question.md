# Product of All Other Numbers
Source: [Interview Cake](https://www.interviewcake.com/question/swift/cake-thief?course=fc1&section=dynamic-programming-recursion)

## You have an array of integers, and for each index you want to find the product of *every integer except the integer at that index.*

Write a function getProductsOfAllIntsExceptAtIndex() that takes an array of integers and returns an array of the products.

For example, given:
```swift
[1, 7, 3, 4]
```

your function would return:
```swift
[84, 12, 28, 21]
```

by calculating:
```swift
[7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]
```

Here's the catch: **You can't use division in your solution!**
