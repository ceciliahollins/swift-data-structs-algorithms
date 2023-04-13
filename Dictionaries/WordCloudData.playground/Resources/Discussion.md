## Use pointers for starts and ends of words, iterating through the message and accounting for puncuation
### time complexity: O(n)
### space complexity: O(n)

This solution is a complicated multi-part problem with a heap of edge cases that should be considered. The problem can be broken down into the following:
* Determing what entails the start and the end of a word, accounting for puncuation
* Iterating through the input to get each word
* Adding and storing word counts in a dictionary

**Determing what entails the start and the end of a word, accounting for puncuation**

First it needs to be decided exactly what annotates the start and finish of a single word. The obvious answer is finding the spaces in between words. The sentence "I like cake" would be fine for this approach, hoewever "I like cake." would return an incorrect answer, as the period would be included with the word 'cake'. What counts as part of a word versus what counts as 'splitter' characters should be decided.

While swift does have built in functions `isWhitespace` and `isPuncuation`, it should be noted that not all puncutation determines the end of a sentence. Words like 'what's' or 'mille-feuille' have punctuation within the word. Because of this, a helper function `isSplittingWord` is created as an extension on the Character class to account for the special cases. This allows for special functionality to be in the algorithms control, rather than leaving it up to Swift to decide. The current function can be improved over time, as more puncuation cases are discovered.

**Iterating through the input to get each word**

The next step is iterating through the input to get each word. The pointers first need to be set, which is done with two helper functions `getWordStart` and `getWordEnd`. `getWordStart` takes the end of the last word from the input, and steps through characters until it finds the start of the next word. The next word is classified as the first next character that is a letter. `getWordEnd` takes the start of the current word from the input, and steps through characters until it finds the end of the current word. The end of a word is classified as either the end of a sentence or puncuation that defines the end of a word. This has already been done above with the helper function `isSplittingWord`. The input is iterated in steps of each words start index, and continues until the wordStart pointer is at the end of the input.

**Adding and storing word counts in a dictionary**

Once the words start and end value have been determined, the word can be pulled out of the input as a substring, converting back into a string, and added to the wordsToCounts dictionary. While there are many approaches to handling uppercased words, the one taken is to lowercase all words before adding into the dictionary for consistency. an if let statement guards nil entries in wordsToCounts. If the word entry in wordsToCounts returns back a value, the value is increased by one and the dictionary is updated. Otherwise, the entry is nil and needs to be added into wordsToCounts, assigning the value of 1 to the word. The next word is then found using the helper functions disucssed above.


A walk through example of all these steps together is shown below:

```swift
input = "I like cake."
wordsToCounts = [:]

wordStart = getWordStart(currWordEnd: 0)
    input[wordStart] = 'I'
    while wordStart != input.endIndex && !input[wordStart].isLetter -> FALSE
wordStart = 0

wordEnd = getWordEnd(currWordStart: 0)
    input[wordEnd] = 'I'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> TRUE
    input[wordEnd] = ' '
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> FALSE
wordEnd = 1

while wordStart < input.endIndex -> TRUE
ITERATION ONE:

wordToPopulate = String(input[0..<1]).lowercased() = "i"
if let count = wordsToCounts[wordToPopulate] -> FALSE
wordsToCounts["i"] = 1

wordStart = getWordStart(currWordEnd: 1)
    input[wordStart] = ' '
    while wordStart != input.endIndex && !input[wordStart].isLetter -> TRUE
    input[wordStart] = 'l'
    while wordStart != input.endIndex && !input[wordStart].isLetter -> FALSE
wordStart = 2

wordEnd = getWordEnd(currWordStart: 2)
    input[wordEnd] = 'l'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> TRUE
    input[wordEnd] = 'i'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> TRUE
    input[wordEnd] = 'k'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> TRUE
    input[wordEnd] = 'e'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> TRUE
    input[wordEnd] = ' '
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> FALSE
wordEnd = 6

while wordStart < input.endIndex -> TRUE
ITERATION TWO:

wordToPopulate = String(input[2..<6]).lowercased() = "like"
if let count = wordsToCounts[wordToPopulate] -> FALSE
wordsToCounts["like"] = 1

wordStart = getWordStart(currWordEnd: 6)
    input[wordStart] = ' '
    while wordStart != input.endIndex && !input[wordStart].isLetter -> TRUE
    input[wordStart] = 'c'
    while wordStart != input.endIndex && !input[wordStart].isLetter -> FALSE
wordStart = 7

wordEnd = getWordEnd(currWordStart: 7)
    input[wordEnd] = 'c'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> TRUE
    input[wordEnd] = 'a'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> TRUE
    input[wordEnd] = 'k'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> TRUE
    input[wordEnd] = 'e'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> TRUE
    input[wordEnd] = '.'
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> FALSE
wordEnd = 11

while wordStart < input.endIndex -> TRUE
ITERATION THREE:

wordToPopulate = String(input[7..<11]).lowercased() = "cake"
if let count = wordsToCounts[wordToPopulate] -> FALSE
wordsToCounts["cake"] = 1

wordStart = getWordStart(currWordEnd: 11)
    input[wordStart] = '.'
    while wordStart != input.endIndex && !input[wordStart].isLetter -> TRUE
    wordStart = input.endIndex
    while wordStart != input.endIndex && !input[wordStart].isLetter -> FALSE
wordStart = 12

wordEnd = getWordEnd(currWordStart: 12)
    wordEnd = input.endIndex
    while wordEnd != input.endIndex && !input[wordEnd].isSplittingWord() -> FALSE
wordEnd = 12

while wordStart < input.endIndex -> FALSE
```

The time complexity comes to O(n), as the main iteration comes from one by one stepping in the `getWordStart` and `getWordEnd` functions. While these functions are using a loop and are called within a loop, the outer loop is not stepping through the input by each character, but instead jumping through each word. It is also important to note that `getWordStart` and `getWordEnd` will only ever take one pass through the input for the whole algorithm. This is optimized as much as possible, as the algorithm needs to take at least one full pass through the input.

The O(n) space comes from the wordsToCounts dictionary that will be returned. Worse case is the wordsToCounts is the same size as the input. There is no way to optimize further for space, as the dictionary is needed to transform the input into the desired result. 

 

