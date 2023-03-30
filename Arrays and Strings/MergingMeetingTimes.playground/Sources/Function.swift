import Foundation

struct Solution {
    
    func mergeRanges(in meetings: [Meeting]) -> [Meeting] {

       // sort meetings by start time O(n log n)
        let sortedMeetings = meetings.sorted(by: { $0.startTime < $1.startTime })
        
        // create new empty array and add the first meeting of the day
        var mergedMeetings: [Meeting] = []
        mergedMeetings.append(sortedMeetings[0])
        
        // loop through sorted meetings and check for overlap
        for i in 1 ..< sortedMeetings.count {
            
            guard let lastMeeting = mergedMeetings.last else { break }
            
            // if the current meeting in inside the range of the last meeting, skip it
            if lastMeeting.startTime <= sortedMeetings[i].startTime
                && lastMeeting.endTime >= sortedMeetings[i].endTime {
            // if there is an overlap in the current and last added meeting, extend the end time
            } else if lastMeeting.endTime >= sortedMeetings[i].startTime {
                mergedMeetings.last?.endTime = sortedMeetings[i].endTime
            // otherwise, no overlap. add the new meeting
            } else {
                mergedMeetings.append(sortedMeetings[i])
            }
        }
        
        return mergedMeetings
    }
}

class Meeting: CustomStringConvertible, Equatable {

    var startTime: Int
    var endTime: Int

    init(startTime: Int, endTime: Int) {

        // number of 30 min blocks past 9:00 am
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

