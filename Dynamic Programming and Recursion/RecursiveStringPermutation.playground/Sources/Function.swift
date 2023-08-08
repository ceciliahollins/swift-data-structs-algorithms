import Foundation

struct Solution {
    
    func getPermutations(for inputString: String) -> Set<String> { 

        // if the input is only one char, only one permutation is possible
        guard inputString.count > 1 else { return [inputString] }

        // create a new set to store permutations
        var permutations: Set<String> = []
        
        // iterate the chars in the input string
        for (i, char) in inputString.enumerated() {
            
            // update the input string with the current char removed
            var updatedInputString = inputString
            let currIndex = updatedInputString.index(updatedInputString.startIndex, offsetBy: i)
            updatedInputString.remove(at: currIndex)
            
            // recursively get permutation for updated input string
            let permutationsToAppend = getPermutations(for: updatedInputString)
            
            // iterate permutations from recursive call, adding the current char to the front
            for permutation in permutationsToAppend {
                let possiblePermutation = "\(char)\(permutation)" // TODO: get rid of nested loop
                permutations.insert(possiblePermutation)
            }
        }
        
        return permutations
    }
}

