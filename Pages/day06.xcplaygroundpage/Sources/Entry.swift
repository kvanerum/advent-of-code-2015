import Foundation

public struct Entry {

    public init(line: String, regex: NSRegularExpression) {
        let match = matchRegex(string: line, regex: regex)

        let action = getCapture(match: match, string: line, index: 1)

        switch action {
        case "turn on":
            self.action = .turnOn
        case "turn off":
            self.action = .turnOff
        case "toggle":
            self.action = .toggle
        default:
            fatalError("Invalid input")
        }

        let fromX = getCapture(match: match, string: line, index: 2)
        let fromY = getCapture(match: match, string: line, index: 3)
        let toX = getCapture(match: match, string: line, index: 4)
        let toY = getCapture(match: match, string: line, index: 5)

        self.from = Coordinate(x: Int(fromX)!, y: Int(fromY)!)
        self.to = Coordinate(x: Int(toX)!, y: Int(toY)!)
    }

    public let action: Action
    public let from: Coordinate
    public let to: Coordinate // swiftlint:disable:this identifier_name
}
