## Reverse the entire string, then reverse each word
### time complexity: O(n)
### space complexity: O(1)

The algorithm starts with reversing the entire string using the same method as reverse string in place algorithm by swapping characters with its respective opposite for O(n) time. 

input: "theif cake"
reverse entire string: "ekac fieht"

The next step is to then go through each reversed words and swap characters in only that word to make it readable again. The start and end index of each word is found, then a for loop is used to swap characters in between those indices. The next start value is found by getting the index directly after the end index, and the end index is updated to be the next space in the message or the end index.

iteration 1:
    * wordStart = 0
    * wordEnd = 4
    * message: "cake fieht"
iteration 2:
    * wordStart = 5
    * wordEnd = 10
    * message: "cake theif"

Because the algorithm is done in place, the space complexity comes to O(1)
