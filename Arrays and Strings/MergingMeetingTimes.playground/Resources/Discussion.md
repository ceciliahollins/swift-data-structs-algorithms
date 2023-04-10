
## Sort the meetings based on start time, then find overlap
### time complexity: O((n log n) + n)
### space complexity: O(n)

This approach involves first sorting the meeting times based on start time to make checking for overlap more straightforward. Once the meetings are sorted, they can be iterated through to check the overlap with the last meeting. The iteration step will be iterating through the sortedMeetings array and take the current meeting and compare it to the last meeting in the mergedMeetings array. If the current meeting is inside the range of the last merged meeting, it will be skipped. If the current meetings start time is less than the last meetings end time, it is an overlap meeting and the two meetings should be merged. It is not possible for the current meetings start time to be less than the last meetings start time, as the sorted meeting is sorted by start time. If neither of these conditions is true, the current meeting has no overlap and should be added to the mergedMeetings array as a new meeting. 

Sorting the meetings will be O(n log n), as well as iteration O(n). It is not possible to avoid the O(n) time, as every meeting will need to be checked for any overlap. Instead of checking every meeting with every other meeting for O(n^2) time, the array can be sorted at the start for O(n log n) time and iterated through to only check the current meeting to the last meeting in the mergedMeetings array, for a O(n) time. Thus gives us a final time complexity of O((n log n) + n). If the meetings were guarantee to be sorted, this algorithm could be done in O(n) time.

The O(n) space comes from a new variable to hold the sorted meetings, and creating an array of merged meetings to hold the output. Worse case is there are no meetings that will be merged, and the output array is the same size as the input. In this case, it is better to create a new veraible to hold the output so not to destruct the original input.



## Check every meeting with every other meeting for overlap
### time complexity: O(n^2)
### space complexity: O(n)

Same as the algorithm above, every meeting in the input needs to be checked for overlap iteravely. However, if the meetings are not sorted, there is no guarantee on where overlaps could occur and therefore the current meeting being checked in the loop will need to be compared to every other meeting in the mergedMeetings array. This is the brute force solution and would cause a time complexity of O(n^2), as the worse case scenario will be every meeting in the input array being checked against every meeting in the merged meetings array. This is worse than O((n log n) + n) algorithm above.
