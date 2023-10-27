## Calculate left then right products to get total product for and index
### time complexity: O(n)
### space complexity: O(n)

This solution takes two iterations of the input to get the product of all ints except the current index, one iteration going forward through the input and one iteration in reverse. The first iteration gets the product of the numbers to the left of the current index, and the second iteration gets the product of the numbers to the right. With the left and right product, the total product is able to be calculated. 

A code example is provided to better understand the solution. To start, a new array is created to hold the output array. 
```swift
ints = [1, 2, 3, 4]
products = [0, 0, 0, 0]
```

A variable currProducts is created to hold the value of the product while iterating forward. The array starts at the 0th index and will iterate until the last index. At each index, the current index of the products array will be assigned the value of currProducts, to represent the products to the left. The value of currProducts is then updated to include the current value in the ints array. This is done after assigning to the output array, since the current index should not be included in the output.
```swift
currProducts = 1

ITERATION 1
i = 0
products[0] = currProducts = 1
products = [1, 0, 0, 0]
currProducts = currProducts * ints[0] = 1 * 1 = 1

ITERATION 2
i = 1
products[1] = currProducts = 1
products = [1, 1, 0, 0]
currProducts = currProducts * ints[1] = 1 * 2 = 2

ITERATION 3
i = 2
products[2] = currProducts =  2
products = [1, 1, 2, 0]
currProducts = currProducts * ints[2] = 2 * 3 = 6

ITERATION 4
i = 3
products[3] = currProducts =  6
products = [1, 1, 2, 6]
currProducts = currProducts * ints[3] = 6 * 4 = 24
```

Once the products to the left have been calculated, the second loop is executed to find the products to the right using the .reversed() method. The currProducts variable is reset to 1 and the loop can begin. This loop is slightly different from the first, in that the value at the current index of the product array must be multiplied to the current value, so to combine the left and right products.
```swift
currProducts = 1

ITERATION 1
i = 3
products[3] = products[3] * currProducts = 6 * 1 = 6
products = [1, 1, 2, 6]
currProducts = currProducts * ints[3] = 1 * 4 = 4

ITERATION 2
i = 2
products[2] = products[2] * currProducts = 2 * 4 = 8
products = [1, 1, 8, 6]
currProducts = currProducts * ints[2] = 4 * 3 = 12

ITERATION 3
i = 1
products[1] = products[1] * currProducts = 1 * 12 = 12
products = [1, 12, 8, 6]
currProducts = currProducts * ints[1] = 12 * 2 = 24

ITERATION 4
i = 0
products[0] = products[0] * currProducts = 1 * 24 = 24
products = [24, 12, 8, 6]
currProducts = currProducts * ints[0] = 24 * 1 = 24
```

This leaves our ouput array at
```swift
[24, 12, 8, 6]
```

This solution has a time complexity of O(2n) accounting for the two itertions, but is simplified to O(n). This time cannot be improved, as every input will need to be iterated at least once. Space complexity is O(n), and also cannot be improved, as a seperate output array needs to be created. It is not possible to edit the input array instead for O(1) space, as the original input array is needed for the first and second iterations. 

## Brute force: nested loop to iterate input for every index
### time complexity: O(n^2)
### space complexity: O(n)

The brute forcce solution involves using a nested loop to iterate the input for every index of the array. The outer loop tracks the current index being calculated, and the inner loops calculates the products. This is an effecient solution of O(n^2) time and should not be used.
