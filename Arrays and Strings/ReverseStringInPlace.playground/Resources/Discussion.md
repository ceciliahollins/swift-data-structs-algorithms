## Swap characters with respective opposites
### time complexity: O(n)
### space complexity: O(1)

While there are other approaches to complete this problem with extra space, the question asks for an in place algoritm, meaning it should change the input directly to save space. To do this, the input string can be split in half and the mirrored characters can be swapped. When iterating, it needs to be ensured the loop stops at halfway through rather than going to the end, or else the string will be swapped then reswapped to be the same as before. This gives us a time complexity of O(n/2), which becomes O(n) with no extra space used for O(1) time complexity.




