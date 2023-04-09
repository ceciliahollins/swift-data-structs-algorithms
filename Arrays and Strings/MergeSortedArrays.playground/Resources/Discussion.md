## Add items from each array one by one, depending on the current items
### time complexity: O(n)
### space complexity: O(n)

This solution takes advantage of the fact that the input arrays are already sorted to assist in bringing down the time complexity. Two tracker variables are created to track the current item of each array, starting at the beginning of each array. If one of the arrays is empty to begin with, the other array is returned. A loop is then used to iterate through the items of the arrays. The two current items are compared, and the lower of the two items is added into the merged array. Only the tracker variable of the array that was just added to the merged array is then updated. The loop finishes when it is the expected length, found by adding the length of the two original arrays together.

The time complexity of O(n) comes from a couple spots in the algorithm. Looping through the arrays until the merged array is full is time O(n). If either array is empty, adding the remaining contents of the other array is time O(n). Finding the smaller of the two items is O(1) and appending that value onto the merged array is time average O(1), worse case O(n). Finding which tracker variable to update is checked by seeing if the item added came from my array or alices array for time O(n).

Space complexity is at O(n), with the merged array holding all items from mine and alices array.



## Combine the arrrays, then sort
### time complexity: O(n log n)
### space complexity: O(n)

A very easy to write solution would be to add alices array onto the end of my array, then sort with a built in sorting function. This would take O(n log n) to sort. If the original input arrays were not sorted, this would be a good solution. However, the fact that the input arrays are always sorted should be taken advantage of.
