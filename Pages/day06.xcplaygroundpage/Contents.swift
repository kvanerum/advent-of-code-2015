import Foundation

let captureRegex = createRegex(regex: #"(toggle|turn on|turn off) (\d+),(\d+) through (\d+),(\d+)"#)
let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: .utf8)
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .split(separator: "\n")
    .map {line in Entry(line: String(line), regex: captureRegex)}

print(algorithm(input: input))
print(algorithm2(input: input))
