import Foundation

struct Solution {
    
    func canTwoMovies(in movieLengths: [Int], fillFlight flightLength: Int) -> Bool {
        
        // create a new set to store movie lengths
        var possibleMovieCombos = Set<Int>()
        
        // iterate the movies
        for movie in movieLengths {
            
            // calculate the length that would be needed for a second movie with the current movie
            let possibleSecondMovie = flightLength - movie
            
            // if the set contains the possible second movie, it is possible to watch two movies in the flight with the current movie in the iteration and the second movie in the set
            if possibleMovieCombos.contains(possibleSecondMovie) {
                return true
            }
            
            // add the current movie to the set to be a possible second movie for next iterations
            possibleMovieCombos.insert(movie)
        }
        
        // there were no combinations of movies
        return false
    }
}

