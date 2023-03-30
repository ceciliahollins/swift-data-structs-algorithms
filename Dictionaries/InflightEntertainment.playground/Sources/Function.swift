import Foundation

struct Solution {
    
    func canTwoMovies(in movieLengths: [Int], fillFlight flightLength: Int) -> Bool {
        
        var possibleMovieCombos = Set<Int>()
        
        // O(n)
        for movie in movieLengths {
            let possibleSecondMovie = flightLength - movie
            if possibleMovieCombos.contains(possibleSecondMovie) {
                return true
            }
            possibleMovieCombos.insert(movie)
        }
        
        return false
    }
}

