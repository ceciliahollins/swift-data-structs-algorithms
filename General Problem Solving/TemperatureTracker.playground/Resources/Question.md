# Temperature Tracker
Source: [Interview Cake](https://www.interviewcake.com/question/swift/temperature-tracker?course=fc1&section=general-programming)

## You decide to test if your oddly-mathematical heating company is fulfilling its All-Time Max, Min, Mean and Mode Temperature Guarantee™.

Write a class TempTracker with these methods:

* insert()—records a new temperature
* getMax()—returns the highest temp we've seen so far
* getMin()—returns the lowest temp we've seen so far
* getMean()—returns the mean ↴ of all temps we've seen so far
* getMode()—returns a mode ↴ of all temps we've seen so far

Optimize for space and time. **Favor speeding up the getter methods getMax(), getMin(), getMean(), and getMode() over speeding up the insert() method.**

getMean() should return a **double**, but the rest of the getter methods can return **integers**. Temperatures will all be inserted as integers. We'll record our temperatures in Fahrenheit, so we can assume they'll all be in the range 0..110. If there is more than one mode, return any of the modes.

