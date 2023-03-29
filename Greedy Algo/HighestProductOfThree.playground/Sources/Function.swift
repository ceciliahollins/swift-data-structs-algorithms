import Foundation

struct Solution {
    
    func highestProductOf3(_ items: [Int]) throws -> Int {
        
        guard items.count >= 3 else {
            throw HighestProductError.lessThanThree
        }
        
        // calculate the highest product of three numbers
        var highestItems: [Int] = Array(items[0...2])
        
        for item in items[3...] { // O(n)
            let lowestItem =  min(highestItems[0], highestItems[1], highestItems[2])
            let lowestItemIndex = highestItems.firstIndex(of: lowestItem) ?? 0
            highestItems[lowestItemIndex] = max(highestItems[lowestItemIndex], item)
        }
        
        return highestItems[0] * highestItems[1] * highestItems[2]
        
    }
}

enum HighestProductError: Error, CustomStringConvertible {
    case lessThanThree
    
    var description: String {
        return "Less than three items"
    }
}

