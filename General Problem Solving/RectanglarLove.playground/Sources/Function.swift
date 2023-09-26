
struct Solution {
    
    func findRectangularOverlap(rect1: Rectangle, rect2: Rectangle) -> Rectangle? {
        
        // find which rect is closer to the x-axis and determine leftX
        let leftX = rect1.leftX <= rect2.leftX
        ? rect2.leftX
        : rect1.leftX
        
        // find which rect is closer to the x-axis and calculate width
        let width = rect1.leftX <= rect2.leftX
        ? min((rect1.leftX + rect1.width) - rect2.leftX, rect2.width)
        : min((rect2.leftX + rect2.width) - rect1.leftX, rect1.width)
        
        // find which rect is closer to the y-axis and determine bottomY
        let bottomY = rect1.bottomY <= rect2.bottomY
        ? rect2.bottomY
        : rect1.bottomY
        
        // find which rect is closer to the y-axis and calculate height
        let height = rect1.bottomY <= rect2.bottomY
        ? min((rect1.bottomY + rect1.height) - rect2.bottomY, rect2.height)
        : min((rect2.bottomY + rect2.height) - rect1.bottomY, rect1.height)
        
        // if the width and height are both greater than zero, there is an overlapping rectangle
        // otherwise return nil, there is no overlap
        return width > 0 && height > 0 ? Rectangle(leftX: leftX, bottomY: bottomY, width: width, height: height) : nil
    }
}

struct Rectangle: CustomStringConvertible {

    // coordinates of bottom left corner
    let leftX: Int
    let bottomY: Int

    // dimensions
    let width: Int
    let height: Int

    var description: String {
        return "(\(leftX), \(bottomY), \(width), \(height))"
    }
}

extension Rectangle: Equatable {
    public static func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
        return
            lhs.leftX == rhs.leftX && lhs.bottomY == rhs.bottomY &&
            lhs.width == rhs.width && lhs.height  == rhs.height
    }
}
