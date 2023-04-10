## Use a set to track unique characters
### time complexity: O(n)
### space complexity: O(n)

Palidromes are strings that are the same forwards and backwards. Looking a bit farther, it is a string that will have the same character on the opposite side of the string. This way of looking at it can provide a better approach to problem solving without having to find permutations manually. Every character in the string should have exactly one matching character, with the exception of one character not having a matching character allowed to account for the middle of the string (if an odd count string). 

For example:
ivicc can be arranged as civic or icvci. It does not matter what the palindrome is, as long as it is possible. The i at index 0 has a matching i at index 2, the c at index 3 has a matching c at index 4, and the v is allowed to not have a match as it is the only character without one and can sit in the middle of the string. 

With this approach, a set can be used to track unique characters. The string will first be iterated. If the current character has a matching charcter in the set, that character is removed as we know there is a match. Otherwise the character is added to the set. For example:
```swift
theString = "ivicc"
uniqueChars = []

ITERATION ONE:
char = 'i'
if uniqueChars.contains(char) // false
uniqueChars = ['i']

ITERATION TWO:
char = 'v'
if uniqueChars.contains(char) // false
uniqueChars = ['i', 'v']

ITERATION THREE:
char = 'i'
if uniqueChars.contains(char) // true
uniqueChars = ['v']

ITERATION FOUR:
char = 'c'
if uniqueChars.contains(char) // false
uniqueChars = ['v', 'c']

ITERATION FOUR:
char = 'c'
if uniqueChars.contains(char) // true
uniqueChars = ['v']
```

We then check that the count is less than or equal to one. One character is allowed to be in the set to be in the middle of the string. In the example above, true is returned. 

Because we need no more than one matching character and the order does not matter, a set can be taken advantage of over storing matches in an array. The set gives O(1) time for functions such as contains, remove, and insert as compared to O(n) for an array. The iteration of the string gives O(n) time, and cannot be avoided as every character should be checked for a matching character. The set will give a space complexity of O(n).



## Try every permutation and check if palindrome
### time complexity: O(n! x n)
### space complexity: O(n! x n)

Every permutation of the input string can be created and each permutation can be checked if it is a palindrome. This is the brute force solution and should not be used. Finding all permutations of a string is O(n!) and checking if that permutation is a palindrome will take O(n) each time. The possible palindomes will also need to be stored, giving O(n! x n) space complexity.
