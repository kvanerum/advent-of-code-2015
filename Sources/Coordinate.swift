import Foundation

public struct Coordinate: Hashable {
    // swiftlint:disable:next identifier_name
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    public let x: Int // swiftlint:disable:this identifier_name
    public let y: Int // swiftlint:disable:this identifier_name
}
