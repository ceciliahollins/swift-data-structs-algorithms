import Foundation

struct Solution {
    func getRandom(floor: Int, ceiling: Int) -> Int {
        return floor + Int(arc4random_uniform(UInt32(ceiling - floor) + 1))
    }

    func shuffle(array: inout [Int]) {

        for (index, _) in array.enumerated() {
            let ranIndex = getRandom(floor:  index, ceiling: array.count - 1)
            let temp = array[ranIndex]
            array[ranIndex] = array[index]
            array[index] = temp
        }
        
        // var ranDict: [Int: Int] = [:]
        // for num in array {
        //     var ranIndex = getRandom(floor: 0, ceiling: array.count - 1)
        //     while ranDict[ranIndex] != nil {
        //         ranIndex = getRandom(floor: 0, ceiling: array.count - 1)
        //     }
        //     ranDict[ranIndex] = num
        // }
        
        // for (i, num) in ranDict {
        //     array[i] = num
        // }

    }
}
