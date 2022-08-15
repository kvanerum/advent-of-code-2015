import Foundation

let vowels: [Character] = ["a", "e", "o", "u", "i"]
let forbiddenSequences = ["ab", "cd", "pq", "xy"]

extension StringProtocol {
    subscript(_ offset: Int) -> Element { self[index(startIndex, offsetBy: offset)] }
    subscript(_ range: Range<Int>) -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: ClosedRange<Int>) -> SubSequence { prefix(range.lowerBound+range.count).suffix(range.count) }
    subscript(_ range: PartialRangeThrough<Int>) -> SubSequence { prefix(range.upperBound.advanced(by: 1)) }
    subscript(_ range: PartialRangeUpTo<Int>) -> SubSequence { prefix(range.upperBound) }
    subscript(_ range: PartialRangeFrom<Int>) -> SubSequence { suffix(Swift.max(0, count-range.lowerBound)) }
}

func containsThreeVowels(str: String) -> Bool {
    var count = 0

    for char in str where vowels.contains(char) {
        count += 1

        if count == 3 {
            return true
        }
    }

    return false
}

func containsConsecutiveSameLetter(str: String) -> Bool {
    for index in 0...(str.count - 2) where str[index] == str[index+1] {
        return true
    }

    return false
}

func containsForbiddenSequences(str: String) -> Bool {
    return forbiddenSequences.contains(where: {str.contains($0)})
}

func isNice1(str: String) -> Bool {
    return containsThreeVowels(str: str)
        && containsConsecutiveSameLetter(str: str)
        && !containsForbiddenSequences(str: str)
}

func containsRepeatingPair(str: String) -> Bool {
    for index in 0..<(str.count - 1) where str[(index+2)...].contains(str[index...index+1]) {
        return true
    }

    return false
}

func containsRepeatingCharacter(str: String) -> Bool {
    for index in 0...(str.count - 3) where str[index] == str[index + 2] {
        return true
    }

    return false
}

func isNice2(str: String) -> Bool {
    return containsRepeatingPair(str: str)
        && containsRepeatingCharacter(str: str)
}

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: .utf8)
    .trimmingCharacters(in: .whitespacesAndNewlines)
    .split(separator: "\n")

print(input.filter {str in isNice1(str: String(str))}.count)
print(input.filter {str in isNice2(str: String(str))}.count)
