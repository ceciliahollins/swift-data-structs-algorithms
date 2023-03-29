import Foundation

struct Solution {
    
    func getPermutations(for inputString: String) -> Set<String> {

        guard inputString.count > 1 else { return [inputString] }

        var permutations: Set<String> = []
        
        for (i, char) in inputString.enumerated() {
            
            var newInputString = inputString
            newInputString.remove(at: newInputString.index(newInputString.startIndex, offsetBy: i))
            
            let permutationsToAppend = getPermutations(for: newInputString)
            for permutation in permutationsToAppend {
                let possiblePermutation = "\(char)\(permutation)"
                permutations.insert(possiblePermutation)
            }
        }
        
        return permutations
    }
}

