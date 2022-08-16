import Foundation

public class Entry {

    public init(_ line: String) {
        let parts = line.split(separator: " ")

        if parts.count == 3 {
            self.oper = .assign
            self.source1 = String(parts[0])
            self.destination = String(parts[2])
        } else if parts.count == 4 {
            self.oper = .not
            self.destination = String(parts[3])
            self.source1 = String(parts[1])
        } else if parts.count == 5 {
            self.source1 = String(parts[0])
            self.source2 = String(parts[2])
            self.destination = String(parts[4])

            switch parts[1] {
            case "AND":
                self.oper = .and
            case "OR":
                self.oper = .or
            case "LSHIFT":
                self.oper = .lshift
            case "RSHIFT":
                self.oper = .rshift
            default:
                fatalError("invalid input")
            }
        } else {
            fatalError("invalid input")
        }
    }

    public let oper: Operator
    public let destination: String
    public var source1: String?
    public var source2: String?
    public var handled = false
}
