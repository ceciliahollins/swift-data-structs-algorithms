# Merging Meeting Times
Source: [Interview Cake](https://www.interviewcake.com/question/swift/cake-thief?course=fc1&section=dynamic-programming-recursion)

## Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when *everyone* is available.

To do this, you’ll need to know when any team is having a meeting. In HiCal, a meeting is stored as an instance of a Meeting class with integer properties startTime and endTime. These integers represent the number of 30-minute blocks past 9:00am.
```swift
class Meeting: CustomStringConvertible {

    var startTime: Int
    var endTime: Int

    init(startTime: Int, endTime: Int) {

        // number of 30 min blocks past 9:00 am
        self.startTime = startTime
        self.endTime = endTime
    }

    var description: String {
        return "(\(startTime), \(endTime))"
    }
}
```

For example:
```swift
let meeting1 = Meeting(startTime: 2, endTime: 3)  // meeting from 10:00 – 10:30 am
let meeting2 = Meeting(startTime: 6, endTime: 9)  // meeting from 12:00 – 1:30 pm
```

Write a function mergeRanges() that takes an array of multiple meeting time ranges and returns an array of condensed ranges.

For example, given:
```swift
[
    Meeting(startTime: 0,  endTime: 1),
    Meeting(startTime: 3,  endTime: 5),
    Meeting(startTime: 4,  endTime: 8),
    Meeting(startTime: 10, endTime: 12),
    Meeting(startTime: 9,  endTime: 10)
]
```

your function would return:
```swift
  [
    Meeting(startTime: 0, endTime: 1),
    Meeting(startTime: 3, endTime: 8),
    Meeting(startTime: 9, endTime: 12)
]
```

**Do not assume the meetings are in order.** The meeting times are coming from multiple teams.

**Write a solution that's efficient even when we can't put a nice upper bound on the numbers representing our time ranges.** Here we've simplified our times down to the number of 30-minute slots past 9:00 am. But we want the function to work even for very large numbers, like Unix timestamps. In any case, the spirit of the challenge is to merge meetings where startTime and endTime don't have an upper bound.


