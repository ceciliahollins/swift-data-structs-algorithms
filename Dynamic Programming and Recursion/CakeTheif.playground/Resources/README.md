# Cake Theif
Source: [Interview Cake](https://www.interviewcake.com/question/swift/cake-thief?course=fc1&section=dynamic-programming-recursion)

## You are a renowned thief who has recently switched from stealing precious metals to stealing cakes because of the insane profit margins. You end up hitting the jackpot, breaking into the world's largest privately owned stock of cakes—the vault of the Queen of England.

While Queen Elizabeth has a limited number of types of cake, she has an unlimited supply of each type.

Each type of cake has a weight and a value, stored in objects of a CakeType struct:
```swift
struct CakeType {
    let weight: UInt
    let value: UInt
}
```

For example:
```swift
// weighs 7 kilograms and has a value of 160 shillings
CakeType(weight: 7, value: 160)

// weighs 3 kilograms and has a value of 90 shillings
CakeType(weight: 3, value: 90)
```

You brought a duffel bag that can hold limited weight, and you want to make off with the most valuable haul possible.

Write a function maxDuffelBagValue() that takes **an array of cake type structs** and **a weight capacity**, and returns **the maximum monetary value the duffel bag can hold.**

For example:
```swift
let cakeTypes = [
    CakeType(weight: 7, value: 160),
    CakeType(weight: 3, value: 90),
    CakeType(weight: 2, value: 15)
]

let capacity = 20

// Returns 555 (6 of the middle type of cake and 1 of the last type of cake)
maxDuffelBagValue(for: cakeTypes, with: capacity)
```

**Weights and values may be any non-negative integer.** Yes, it's weird to think about cakes that weigh nothing or duffel bags that can't hold anything. But we're not just super mastermind criminals—we're also meticulous about keeping our algorithms flexible and comprehensive.
