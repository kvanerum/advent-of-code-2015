import Foundation

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
var input = try String(contentsOf: fileURL!, encoding: .utf8)
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .split(separator: "\n")
    .map {line in Entry(String(line))}

func isResolved(_ input: String, _ wires: [String: UInt16]) -> Bool {
    return UInt16(input) != nil || wires.keys.contains(input)
}

func resolve(_ input: String, _ wires: [String: UInt16]) -> UInt16 {
    if let result = UInt16(input) {
        return result
    }

    return wires[input]!
}

func calculateWireA(input: [Entry]) -> UInt16 {
    var wires: [String: UInt16] = [:]

    while (input.filter {!$0.handled}.count > 0) {
        for entry in input where entry.handled == false {
            if entry.oper == .assign && isResolved(entry.source1!, wires) {
                wires[entry.destination] = resolve(entry.source1!, wires)
            } else if entry.oper == .not && isResolved(entry.source1!, wires) {
                wires[entry.destination] = ~resolve(entry.source1!, wires)
            } else if (entry.oper == .and || entry.oper == .or) &&
                        isResolved(entry.source1!, wires) && isResolved(entry.source2!, wires) {
                if entry.oper == .and {
                    wires[entry.destination] = resolve(entry.source1!, wires) & resolve(entry.source2!, wires)
                } else {
                    wires[entry.destination] = resolve(entry.source1!, wires) | resolve(entry.source2!, wires)
                }
            } else if (entry.oper == .lshift || entry.oper == .rshift) && isResolved(entry.source1!, wires) {
                let offset = UInt(entry.source2!)!

                if entry.oper == .lshift {
                    wires[entry.destination] = resolve(entry.source1!, wires) << offset
                } else {
                    wires[entry.destination] = resolve(entry.source1!, wires) >> offset
                }
            } else {
                continue
            }

            entry.handled = true
        }
    }

    return wires["a"]!
}

let wireA = calculateWireA(input: input)
print(wireA)

// override wire B with value of wire A
input.first {$0.destination == "b"}?.source1 = String(wireA)
input.forEach {$0.handled = false}
print(calculateWireA(input: input))
