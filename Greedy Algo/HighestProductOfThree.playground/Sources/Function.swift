import Foundation

struct Solution {
    
    func highestProductOf3(_ items: [Int]) throws -> Int {
        
        guard items.count >= 3 else {
            throw HighestProductError.lessThanThree
        }
        
        var maxOne: Int = Int.min // highest value
        var maxTwo: Int = Int.min // second highest value
        var maxThree: Int = Int.min // third highest value
        
        var minOne: Int = Int.max // lowest value
        var minTwo: Int = Int.max // second lowest value
        
        // iterate the input
        for item in items {
            
            // if the current item is higher than the current highest value, shift values down and reassign maxOne
            if item > maxOne {
                maxThree = maxTwo
                maxTwo = maxOne
                maxOne = item
            // if the current item is in between the highest and current second highest value, shift values down from second highest value and reassign maxTwo
            } else if item > maxTwo {
                maxThree = maxTwo
                maxTwo = item
            // if the current item is in between the second highest and current third highest value, reassign maxThree
            } else if item > maxThree {
                maxThree = item
            }
            
            // if the current item is lower than the current lowest value, shift values down and reassign minOne
            if item < minOne {
                minTwo = minOne
                minOne = item
            // if the current item is in between the lowest and current second lowest value, reassign minTwo
            } else if item < minTwo {
                minTwo = item
            }
        }
        
        // calculate the two possibilities to produce the highest product
        // * three highest values
        // * one high positive value and two very low negative values to cancel out and multiply to a positive
        
        // multiple all three highest values
        let possibilityOne = maxOne * maxTwo * maxThree
        // multiply the highest value and the two lowest values
        let possibilityTwo = maxOne * minOne * minTwo
        
        // return the higher product
        return max(possibilityOne, possibilityTwo)
    }
}

enum HighestProductError: Error, CustomStringConvertible {
    case lessThanThree
    
    var description: String {
        return "Less than three items"
    }
}

