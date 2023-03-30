# Rectangular Love
Source: [Interview Cake](https://www.interviewcake.com/question/swift/rectangular-love?course=fc1&section=general-programming)

## A crack team of love scientists from OkEros (a hot new dating site) have devised a way to represent dating profiles as rectangles on a two-dimensional plane.

**They need help writing an algorithm to find the intersection of two users' love rectangles.** They suspect finding that intersection is the key to a matching algorithm so powerful it will cause an immediate acquisition by Google or Facebook or Obama or something.

TODO: add figure-0 link

**Write a function to find the rectangular intersection of two given love rectangles.**

As with the example above, love rectangles are always "straight" and never "diagonal." More rigorously: each side is parallel with either the x-axis or the y-axis.

They are defined as instances of the Rectangle structure:
```swift
struct Rectangle: CustomStringConvertible {

    // coordinates of bottom left corner
    let leftX: Int
    let bottomY: Int

    // dimensions
    let width: Int
    let height: Int

    var description: String {
        return "(\(leftX), \(bottomY), \(width), \(height))"
    }
}
```

Your output rectangle should be a Rectangle structure as well.
