import Foundation

struct Solution {
    
    func mergeArrays(_ myArray: [Int], _ alicesArray: [Int]) -> [Int] {
        
        // create a new variable to hold merged arrays
        var merged: [Int] = []
        
        // check if either array is empty, otherwise return the others array
        guard !myArray.isEmpty else { return alicesArray }
        guard !alicesArray.isEmpty else { return myArray }
        
        // create variables to track indices for each array
        var myIndex = 0
        var alicesIndex = 0
        
        // iterate the arrays until the merged array is full
        while merged.count < myArray.count + alicesArray.count {
            
            // if my array is empty, merge the rest of alices array and break
            guard myIndex != myArray.count else {
                merged.append(contentsOf: Array(alicesArray[alicesIndex...]))
                break
            }
            
            // if alices array is empty, merge the rest of alices array and break
            guard alicesIndex != alicesArray.count else {
                merged.append(contentsOf: Array(myArray[myIndex...]))
                break
            }
        
            // find the next item to merge by getting the smaller out of the current item from each of our arrays and add it to the merged arrays
            let nextItem = min(myArray[myIndex], alicesArray[alicesIndex])
            merged.append(nextItem)
            
            // update the index from whoevers array the last item was merged from
            if myArray.contains(nextItem) { myIndex += 1 } else { alicesIndex += 1 }
        }
        
        return merged
    }
}

