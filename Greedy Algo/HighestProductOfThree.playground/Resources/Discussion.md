## Iterate the array and store values in constant variables to find maximum product
### time complexity: O(n)
### space complexity: O(1)

Rather than needing to consider all possibilities or dividing the problem into sub solutions, a greedy solution can be used to simply get the 3 highest values and multiply for the highest product. This will always garuntee an optimal solution and there is no need to go back or revise previous choices, resulting in a better time complexity.

There are two possibilities when finding the maximum product- multiplying the highest 3 numbers or the highest number and the two lowest negative numbers. Multiplying the highest 3 numbers is an obvious way to get the highest product, but it is possible the absolute of the two lowest numbers are higher than the highest numbers. This can be taken advantage of, and by multiplying two negative numbers can get a positive value. In the example:
```
[-100,-1, 1, 2, 3]
```
-100 x -1 x 3 will produce a higher product than the 3 highest numbers, 1 x 2 x 3. Therefore we must consider negative values as well.

Constant variables are created to hold the three highest and two lowest numbers. These values are defaulted to Int.min for the three high values and Int.max for the two low values. If there are constraints on the input, the min and max default values should be assigned to the edge constraints instead, as Int.min and Int.max hold extra space. For example, in the same [leetcode problem](https://leetcode.com/problems/maximum-product-of-three-numbers), the values are constraint from -1000 to 1000. Space can be saved by defualting the max values to -1000 and min values to 1000.

The input is then iterated and conditionals are used to determine if the current item in the array is one of the highest or lowest values. If true, the necessary items are shifted down and the item is assigned in the correct position. Once the three highest and two lowest values are found, the possible products are calculated and the maximum between the solutions are returned.

This solution results in O(n) time complexity accounting for the iteration of the entire input, and O(1) space as only constant space is added. There is no known way to improve the time complexity, as all values in the input must be considered since the input array is not sorterd.

Another variation of this solution is to use constant sized arrays to hold min and max values instead of constant variables. Technically, an array will take up more space than individual variables, but will be faster access and edits. Wether space or time is prioritized should be considered for which solution is implemented.

## Sort the array to find values for maximum product
### time complexity: O(nlogn)
### space complexity: O(n)

As stated above- there are two possibilities when finding the maximum product. Multiplying the highest three numbers or the highest number and the two lowest negative numbers. This can be done by sorting the array and assigning the two lowest numbers and the three highest into constant variables. The two possible highest products will be calculated, and the max value will be returned between these two. 

While this solution seems short and straightforward, sorting the array is O(nlogn) time complexity and O(n) space is added to hold the sorted array. Both time and space can be brought down for a better overall solution.

## Brute force: three nested loops to check every combination
### time complexity: O(n^3)
### space complexity: O(1)

The brute force solution would be three nested loops to iterate and calculate the highest sum manually. Worse case time for this solution is O(n^3) and should not be used.
