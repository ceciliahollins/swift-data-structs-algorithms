## Add space to decrease time
### time complexity: O(1)
    insert: O(1)
    getMax: O(1)
    getMin: O(1)
    getMean: O(1)
    getMode: O(n)
### space complexity: O(n)

By adding space to the class, time can be decreased to O(1) in most of the methods. Rather than calculating temperature methods every time a method is run, the calculations can be done as temperatures are added.
```swift
// temperatures: [temperature value: num of times in data]
var temperatures: [Int: Int] = [:]

var currMax: Int = -999
var currMin: Int = 999

var numOfTemps: Int = 0
var totalTempsValue: Int = 0

func insert(temperature: Int) {
    temperatures[temperature] = (temperatures[temperature] ?? 0) + 1
    
    currMax = max(temperature, currMax)
    currMin = min(temperature, currMin)
    
    numOfTemps += 1
    totalTempsValue += temperature
}
```

This allows for getMax, getMin, and getMean to decrease time down to O(1), as it will only be returning the constant stored values rather than needing to calculate every time. 
```swift
func getMax() -> Int? {
    return currMax
}

func getMin() -> Int? {
    return currMin
}

func getMean() -> Double? {
    return Double(totalTempsValue / numOfTemps)
}

func getMode() -> Int? {
    let mode = temperatures.values.max()
    return temperatures.first(where: { $0.value == mode })?.key
}
```
the getMode method could be improved by having a caching system and storing the first couple highest modes, but worse case will still be O(n), as the cache will need to be recalculated in certain instances.


## Use a dictionary to track number of times a temperature is in the data
### time complexity: O(n)
    insert: O(1)
    getMax: O(n)
    getMin: O(n)
    getMean: O(n)
    getMode: O(n)
### space complexity: O(n)

This solution utilizes the same logic as described in **Use an array to track number of times a temperature is in the data**, but would still work if the constraint of temperatures being between 0 and 110 was not available. The dictionary would allow for negative temperatures as well as floating number temperatures if desired, making this solution better than an array.
```swift
// temperatures: [temperature value: num of times in data]
var temperatures: [Int: Int] = [:]
// OR
var floatingTemperatures: [Double: Int] = [:]

func insert(temperature: Int) {
    temperatures[temperature] = (temperatures[temperature] ?? 0) + 1
}
```

Time complexities of the methods would stay the same as using an array.
```swift
func getMax() -> Int? {
    return temperatures.keys.max()
}

func getMin() -> Int? {
    return temperatures.keys.min()
}

func getMean() -> Int? {
    var tempsTotal = 0
    var count = 0
    for (key, value) in temperatures {
        count += value
        tempsTotal += (key * value)
    }
    return Double(tempsTotal / count)
}

func getMode() -> Int? {
    let mode = temperatures.values.max()
    return temperatures.first(where: { $0.value == mode })?.key
}
```


## Use an array to track number of times a temperature is in the data
### time complexity: O(n)
    insert: O(1)
    getMax: O(n)
    getMin: O(n)
    getMean: O(n)
    getMode: O(n)
### space complexity: O(n)

By updating the data from all temperatures being added in an array as noted in **Use an array to track all temperatures**, the array can instead hold the number of times a temperature has been recorded, using the index to correlate to the temperature. This can be done because the problem statement says the temperatures are constrained between 0 and 110- otherwise this solution would not work.
```swift
var temp: [Int] = Array(repeating: 0, count: 110)

func insert(temperature: Int) {
    temperatures[temperature] += 1
}
```

While worse case is space complexity of O(n), it constrains the space to be between 0 and 110 values, realistically drastically improving the space from just using an array to store all temperatures.
```swift
func getMax() -> Int? {
    for (temperature, numOfTemps) in temperatures.reversed().enumerated() {
        if temperature != 0 {
            return index
        }
    }
}

func getMin() -> Int? {
    for (temperature, numOfTemps) in temperatures.enumerated() {
        if temperature != 0 {
            return index
        }
    }
}

func getMean() -> Int? {
    var tempsTotal = 0
    var count = 0
    for (temperature, numOfTemps) in temperatures.enumerated() {
        count += numOfTemps
        tempsTotal += (temperature * numOfTemps)
    }
    
    return Double(tempsTotal / count)
}

func getMode() -> Int? {
    return getMax()
}
```


## Use an array to track all temperatures
### time complexity: O(n)
    insert: O(n)
    getMax: O(n)
    getMin: O(n)
    getMean: O(n)
    getMode: O(n)
### space complexity: O(n)

The first thought solution would be to create an array and add new temperatures to the end of the array. 
```swift
var temperatures: [Int] = []

func insert(temperature: Int) {
    temperatures.append(temperature)
}
```

This produces time complexity of O(n) for all methods, and could create a very large data structure once heaps of temperatures are added. This would make time even worse as more data is added over time.
```swift
func getMax() -> Int? {
    return temperatures.getMax()
}

func getMin() -> Int? {
    return temperatures.getMin()
}

func getMean() -> Int? {
    var tempsTotal = 0
    for temperature in temperatures {
        count += 1
        tempsTotal += temperature
    }
    return Double(tempsTotal / temperatures.count)
}
```
