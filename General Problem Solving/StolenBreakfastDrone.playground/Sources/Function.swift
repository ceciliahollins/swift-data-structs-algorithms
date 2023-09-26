import Foundation

struct Solution {
    
    func findUniqueDeliveryId(in deliveryIds: [Int]) -> Int {

        // create a new set to track take off and landings
        var takeOffLog: Set<Int> = []
        
        // iterate deliveries
        for id in deliveryIds {
            
            // if the current ID is contained in the set, the drone has already taken off and is now landing
            if takeOffLog.contains(id) {
                // the ID should be removed from the log
                takeOffLog.remove(id)
            } else {
                // the drone is taking off, add the ID to the log
                takeOffLog.insert(id)
            }
        }
        
        // only one ID will remain in the log, return this ID
        return takeOffLog.removeFirst()
    }
}

