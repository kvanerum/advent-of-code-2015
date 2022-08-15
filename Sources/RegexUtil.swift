import Foundation

public func createRegex(regex: StringLiteralType) -> NSRegularExpression {
    do {
        return try NSRegularExpression(pattern: regex)
    } catch {
       fatalError("invalid regex")
    }
}

public func matchRegex(string: String, regex: NSRegularExpression) -> NSTextCheckingResult {
    let stringRange = NSRange(
        string.startIndex..<string.endIndex,
        in: string
    )

    return regex.matches(
        in: String(string),
        options: [],
        range: stringRange
    ).first!
}

public func getCapture(match: NSTextCheckingResult, string: String, index: Int) -> String {
    let range = match.range(at: index)

    let substringRange = Range(range, in: string)!
    return String(string[substringRange])
}
