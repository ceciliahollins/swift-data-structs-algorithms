class Solution {

    // temperatures: [temperature value: num of times in data]
    var temperatures: [Int: Int] = [:]
    
    var currMax: Int = -999
    var currMin: Int = 999
    
    var numOfTemps: Int = 0
    var totalTempsValue: Int = 0
    
    // records a new temperature: O(1)
    func insert(temperature: Int) {
        temperatures[temperature] = (temperatures[temperature] ?? 0) + 1
        
        currMax = max(temperature, currMax)
        currMin = min(temperature, currMin)
        
        numOfTemps += 1
        totalTempsValue += temperature
    }

    // returns the highest temp we've seen so far: O(1)
    func getMax() -> Int? {
        return currMax
    }

    // returns the lowest temp we've seen so far: O(1)
    func getMin() -> Int? {
        return currMin
    }

    // returns the mean of all temps we've seen so far: O(1)
    func getMean() -> Double? {
        return Double(totalTempsValue / numOfTemps)
    }

    // return a mode of all temps we've seen so far: O(n)
    func getMode() -> Int? {
        let mode = temperatures.values.max()
        return temperatures.first(where: { $0.value == mode })?.key
    }
}
