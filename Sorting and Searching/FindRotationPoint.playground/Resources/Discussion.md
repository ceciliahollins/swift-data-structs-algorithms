## Create subsets based on middle point, until result is the middle point (Binary Search)
### time complexity: O(logn)
### space complexity: O(1)

Because the input array is sorted, a binary search algorithm can be used to lower the time complexity of a brute force solution. Binary search involves a divide and conquer approach, where the input array is split into subsets and searched based on the value of the middle point. 

A lowerWall and upperWall variable are first created, starting as the start and end index of the array. A middle variable is then created, using the lower and upper wall to find the middle point.
```swift
var lowerWall = 0
var upperWall = words.count - 1
var middle = (upperWall - lowerWall) / 2
```

A while loop then iterates until the lower wall hits the upper wall. Inside the while loop, a conditional decides if the rotation point is within the lower half, the upper half, or the middle point is the rotation point. 
```swift
while lowerWall < upperWall { ... }
```

It should be noted before continuing how Swift handles String comparisons. Two Strings can be directly compared and the String that would be first in alphabetical order will be the lower value. For example, in "Apple" < "Banana", "Apple" will compare lower than "Banana", and this conditional will return true.

Continuing back into the conditional within the loop- if the word at the middle is greater than the next word after middle, the rotation point has been found. The word after the middle point is the rotation point and should be returned. 
```swift
if words[middle] > words[middle + 1] {
    return middle + 1
}
```
An example of this condition returning true might be if words[middle] = "Zebra" and words[middle + 1] = "Apple". "Zebra" is later in the alphabetical list and is therefore greater than "Apple", so we know "Apple" is the rotation point.

If the rotation point has not been found, the lower and upper halves should be inspected to decide which half should be searched. If the word at the lower wall is greater that the word at the middle, the rotation point is in the lower half. The upper wall should be updated to the middle point.
```swift
else if words[lowerWall] > words[middle] {
    upperWall = middle
}
```
An example of this condition returning true might be if words[lowerWall] = "Orange", and words[middle] = "Banana". "Orange" is later in the alphabetical list and is therefore greater than "Apple", so we know the rotation point is somewhere in the lower half. The upper wall gets updated to the index of "Banana", and the subset between "Orange" and "Banana" will be searched.

Lastly, if the rotation point has not been found or the rotation point is not in the lower half, it is known that the rotation point is in the upper half. The lowerWall should be updated to the middle point.
```swift
else {
    lowerWall = middle
}
```

Before continuing into the next iteration, the middle point should be updated to reflect the changes of the lower and upper walls. The iteration then continues until either the rotation point is found, or the lower wall hits the upper wall. If all halves are searched and the middle point has not been found, the middle point can be returned as this will be the rotation point.


One consideration that should be discussed is the rounding nature of finding a new middle point, and why the first condition in the iteration is 'words[middle] > words[middle + 1]' and not 'words[middle] < words[middle - 1]'. In the example:
```swift
words = ["grape", "orange", "apple"]
lowerWall = 0
upperWall = 2
```
The middle point can be easily found as (2-0)/2. which will be index 1 "orange". However, in the example:
```swift
words = ["orange", "apple"]
lowerWall = 0
upperWall = 1
```
The middle point is rounded down due to integer division, where the middle point is (1-0)/2 equaling 0.5 and rounding to index 0 "orange". If the condition words[middle] < words[middle - 1] were to be used to find the middle point, there would be an out of bounds exception and the algorithm would crash. Becuase of integer division, it is important to check the next index above the middle, as the middle point will round down and cause issues in smaller arrays.


Time complexity of this algorithm is O(logn), as the input is getting split in half with every iteration. Divide and conquer algorithms such as this one have linear time complexeites as the input goes up exponentially. Space complexity is O(1), as only constant extra space is needed.

## Search every item in the array (Linear Search, Brute Force)
### time complexity: O(n)
### space complexity: O(1)

Brute force solution, also known as the linear search solution, would be to check every single item in the array until the rotation point is found. Time complexity for this solution is O(n), and while that is not a bad time complexity, it is possible to do better.

