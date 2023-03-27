class TempTracker {

    // implement methods to track the max, min, mean, and mode
    var temperatures: [Int: Int] = [:]

    // records a new temperature
    func insert(temperature: Int) {
        if temperatures[temperature] != nil {
            temperatures[temperature]! += 1
        } else {
            temperatures[temperature] = 1
        }
        print(temperatures)
    }

    // returns the highest temp we've seen so far
    func getMax() -> Int? {
        return temperatures.keys.max()
    }

    // returns the lowest temp we've seen so far
    func getMin() -> Int? {
        return temperatures.keys.min()
    }

    // returns the mean of all temps we've seen so far
    func getMean() -> Double? {
        var tempsTotal = 0
        var count = 0
        for (key, value) in temperatures {
            count += value
            tempsTotal += (key * value)
        }
        
        return Double(tempsTotal / count)
    }

    // return a mode of all temps we've seen so far
    func getMode() -> Int? {
        let mode = temperatures.values.max()
        return temperatures.first(where: { $0.value == mode })?.key
    }
}
