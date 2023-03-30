import Foundation

struct Solution {
    
    func reverseWords(_ message: inout [Character]) {
         var newMessage: [Character] = []
         var currEndIndex = message.count - 1
         var currStartIndex = message.count - 1
         while currStartIndex >= 0 {
             if currStartIndex == 0 || message[currStartIndex - 1] == " " {
                 for i in currStartIndex  ... currEndIndex {
                     newMessage.append(message[i])
                 }

                 if currStartIndex != 0 {
                     newMessage.append(" ")
                     currEndIndex = currStartIndex - 2
                 }
             }
             currStartIndex -= 1
         }
        
         message = newMessage
    }
}

