import Foundation

struct Solution {
    
    func mergeRanges(in meetings: [Meeting]) -> [Meeting] {
        
        // sort meetings by start time
        // time: O(n log n)
        // space: O(n)
        let sortedMeetings = meetings.sorted(by: { $0.startTime < $1.startTime })
        
        // create new empty array and add the first meeting of the day
        // space: O(n)
        var mergedMeetings: [Meeting] = []
        guard !sortedMeetings.isEmpty else { return [] }
        mergedMeetings.append(sortedMeetings[0])
        
        // loop through sorted meetings and check for overlap
        // time: O(n)
        for i in 1 ..< sortedMeetings.count {
            
            guard let lastMergedMeeting = mergedMeetings.last else { break }
            
            let currentMeeting = sortedMeetings[i]
            
            // if the current meeting in inside the range of the last meeting, skip it
            if lastMergedMeeting.startTime <= currentMeeting.startTime
                && lastMergedMeeting.endTime >= currentMeeting.endTime {
                continue
                
            // if there is an overlap in the current and last added meeting, extend the end time
            } else if lastMergedMeeting.endTime >= currentMeeting.startTime {
                mergedMeetings.last?.endTime = currentMeeting.endTime
                
            // otherwise, no overlap- add the new meeting
            } else {
                mergedMeetings.append(currentMeeting)
            }
        }
        
        return mergedMeetings
    }
}

class Meeting: CustomStringConvertible, Equatable {
    
    // number of 30 min blocks past 9:00 am
    var startTime: Int
    var endTime: Int
    
    init(startTime: Int, endTime: Int) {
        
        self.startTime = startTime
        self.endTime = endTime
    }
    
    var description: String {
        return "(\(startTime), \(endTime))"
    }
    
    static func == (lhs: Meeting, rhs: Meeting) -> Bool {
        return lhs.startTime == rhs.startTime && lhs.endTime == rhs.endTime
    }
}

