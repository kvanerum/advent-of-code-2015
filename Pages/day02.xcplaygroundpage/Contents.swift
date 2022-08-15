import Foundation

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: .utf8).trimmingCharacters(in: .whitespacesAndNewlines)

let lines = input.split(separator: "\n")

// part 1
let totalArea = lines.map {calculateNecessaryArea(input: String($0))}.reduce(0, +)
print(totalArea)

// part 2
let totalLength = lines.map {calculateNecessaryLength(input: String($0))}.reduce(0, +)
print(totalLength)

func calculateNecessaryArea(input: String) -> Int {
    let split = input.split(separator: "x")

    let l = Int(split[0])! // swiftlint:disable:this identifier_name
    let w = Int(split[1])! // swiftlint:disable:this identifier_name
    let h = Int(split[2])! // swiftlint:disable:this identifier_name

    let side1 = l * w
    let side2 = l * h
    let side3 = w * h

    return 2 * side1 + 2 * side2 + 2 * side3 + min(side1, side2, side3)
}

func calculateNecessaryLength(input: String) -> Int {
    let split = input.split(separator: "x")

    let l = Int(split[0])! // swiftlint:disable:this identifier_name
    let w = Int(split[1])! // swiftlint:disable:this identifier_name
    let h = Int(split[2])! // swiftlint:disable:this identifier_name

    let side1 = 2 * l + 2 * w
    let side2 = 2 * l + 2 * h
    let side3 = 2 * w + 2 * h

    return min(side1, side2, side3) + l * w * h
}
