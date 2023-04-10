## Use a set to store possible movie combinations
### time complexity: O(n)
### space complexity: O(n)

By using a set, functions such as contains and insert only takes O(1) time. It is safe to use a set over an array, as the order of the movies does not matter and the movie lengths will be unique, as it does matter which movie holds what length as long as there is a possible movie with a specific length to watch. 

The algorithm starts by creating a set possibleMovieCombos, which will hold available movies that could be paired with another movie. The movieLengths are then iterated. A possible second movie is calculate by subtracting the current movie from the flight length. If this movie length is in the available movies set, it is known we have a possible combination of movies and true can be returned. Otherwise, the movie is added into the movies set to be considered for a later combination. If the entire array is iterated and no combinations are found, then there are no combinations.

Time complexity O(n) comes from the iteration of movieLengths. This iteration cannot be avoided, as we should check every movie for a combination. Time was saved by using a set instead of an array, as the contains and insert methods are only O(1) as compared to O(n) for an array. While this does add O(n) space, time should be prioritized for this solution.



## Iterate movies and search for match using Array.contains
### time complexity: O(n)
### space complexity: O(1)

Theoretically this solution looks better as it does not use extra space, however there are extra steps that will cost most time that need to be considered. Iterating through the movieLengths is similar as above. While iterating, the possible second movie length can be found using movieLengths.contains(possibleSecondMovie). Using the contains method on an array costs O(n) time, putting the exact time complexity at O(2n). This solution also does not account for the possible scenario that the current movie length is exactly half of the flight length, and the contains method will return itself, giving an inaccurate solution. Accounting for this will also take extra time and potentially extra space. 



## Test all combinations of movies
### time complexity: O(n^2)
### space complexity: O(1)

This solution would use a nested for loop to test every combination of every movie, giving a time complexity of O(n^2). This is a brute force approach and should not be used.

