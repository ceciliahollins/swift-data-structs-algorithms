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

func findRectangularOverlap(rect1: Rectangle, rect2: Rectangle) -> Rectangle? {
    
    guard rect1 != rect2 else { return rect1 }
    
    if (rect1.leftX <= rect2.leftX && rect1.leftX + rect1.width > rect2.leftX) { // left intersection
        if (rect1.bottomY <= rect2.bottomY && rect1.bottomY + rect1.height > rect2.bottomY) { // bottom intersection
            print("left bottom intersection")
            let leftX = rect2.leftX
            let bottomY = rect2.bottomY
            let width = (rect1.leftX + rect1.width) - rect2.leftX
            let height = (rect1.bottomY + rect1.height) - rect2.bottomY
            
            return Rectangle(leftX: leftX, bottomY: bottomY, width: width, height: height)
            
        } else if (rect2.bottomY <= rect1.bottomY && rect2.bottomY + rect2.height > rect1.bottomY) { // top intersection
            let leftX = rect2.leftX
            let bottomY = rect1.bottomY
            let width = (rect1.leftX + rect1.width) - rect2.leftX
            let height = (rect2.bottomY + rect2.height) - rect1.bottomY
            
            return Rectangle(leftX: leftX, bottomY: bottomY, width: width, height: height)
        }
    } else if (rect2.leftX <= rect1.leftX && rect2.leftX + rect2.width > rect1.leftX) { // right intersection
        if (rect1.bottomY <= rect2.bottomY && rect1.bottomY + rect1.height > rect2.bottomY) { // bottom intersection
            let leftX = rect1.leftX
            let bottomY = rect1.bottomY
            let width = (rect2.leftX + rect2.width) - rect1.leftX
            let height = (rect1.bottomY + rect1.height) - rect2.bottomY
            
            return Rectangle(leftX: leftX, bottomY: bottomY, width: width, height: height)
            
        } else if (rect2.bottomY <= rect1.bottomY && rect2.bottomY + rect2.height > rect1.bottomY) { // top intersection
            let leftX = rect1.leftX
            let bottomY = rect2.bottomY
            let width = (rect1.leftX + rect1.width) - rect2.leftX
            let height = (rect2.bottomY + rect2.height) - rect1.bottomY
            
            return Rectangle(leftX: leftX, bottomY: bottomY, width: width, height: height)
        }
    }
                                        
    return nil
}
