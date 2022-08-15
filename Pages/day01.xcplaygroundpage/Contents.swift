import Foundation

let fileURL = Bundle.main.url(forResource: "example", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: .utf8).trimmingCharacters(in: .whitespacesAndNewlines)

var currentFloor = 0
var charPosition = 0
var firstBasementPosition: Int?

for char in input {
    charPosition += 1

    if char == "(" {
        currentFloor += 1
    } else {
        currentFloor -= 1
    }

    if currentFloor < 0 && firstBasementPosition == nil {
        firstBasementPosition = charPosition
    }
}

print(currentFloor)
print(firstBasementPosition!)
