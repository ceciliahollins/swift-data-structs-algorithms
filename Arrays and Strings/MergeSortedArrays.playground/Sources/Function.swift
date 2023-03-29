import Foundation

struct Solution {
    
    func mergeArrays(_ myArray: [Int], _ alicesArray: [Int]) -> [Int] {

        // combine the sorted arrays into one large sorted array
        
        var merged: [Int] = []
        
        guard !myArray.isEmpty else { return alicesArray } // O(1)
        guard !alicesArray.isEmpty else { return myArray } // O(1)
        
        var myIndex = 0
        var alicesIndex = 0
        
        // O(n)
        while merged.count < myArray.count + alicesArray.count {
            guard myIndex != myArray.count else {
                merged.append(contentsOf: Array(alicesArray[alicesIndex...])) // O(n)
                break
            }
            guard alicesIndex != alicesArray.count else {
                merged.append(contentsOf: Array(myArray[myIndex...])) // O(n)
                break
            }
        
            let nextItem = min(myArray[myIndex], alicesArray[alicesIndex]) // O(1)
            merged.append(nextItem)
            if myArray.contains(nextItem) { myIndex += 1 } else { alicesIndex += 1 } // O(n)
        }
        
        return merged
    }
}

