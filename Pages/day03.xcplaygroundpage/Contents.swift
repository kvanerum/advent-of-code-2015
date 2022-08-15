import Foundation

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let input = try String(contentsOf: fileURL!, encoding: .utf8).trimmingCharacters(in: .whitespacesAndNewlines)

// part 1
var visitedCoordinates = Set<Coordinate>()
var currentCoordinate = Coordinate(x: 0, y: 0)

for instruction in input {
    visitedCoordinates.insert(currentCoordinate)

    currentCoordinate = doMove(from: currentCoordinate, move: instruction)
}

visitedCoordinates.insert(currentCoordinate)

print(visitedCoordinates.count)

// part 2
visitedCoordinates.removeAll()
var santaPosition = Coordinate(x: 0, y: 0)
var roboSantaPosition = Coordinate(x: 0, y: 0)
var step = 0
visitedCoordinates.insert(santaPosition)

for instruction in input {
    if step % 2 == 0 {
        santaPosition = doMove(from: santaPosition, move: instruction)
        visitedCoordinates.insert(santaPosition)
    } else {
        roboSantaPosition = doMove(from: roboSantaPosition, move: instruction)
        visitedCoordinates.insert(roboSantaPosition)
    }

    step += 1
}

print(visitedCoordinates.count)

func doMove(from: Coordinate, move: Character) -> Coordinate {
    switch move {
    case "^":
       return Coordinate(x: from.x, y: from.y - 1)
    case "v":
        return Coordinate(x: from.x, y: from.y + 1)
    case ">":
        return Coordinate(x: from.x + 1, y: from.y)
    case "<":
        return Coordinate(x: from.x-1, y: from.y)
    default:
        fatalError("Invalid input")
    }
}
