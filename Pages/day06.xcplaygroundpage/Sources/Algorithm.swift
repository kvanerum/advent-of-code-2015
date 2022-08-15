import Foundation

public func algorithm(input: [Entry]) -> Int {
    var lightsOn: Set<Coordinate> = Set()

    for entry in input {
        for y in entry.from.y...entry.to.y { // swiftlint:disable:this identifier_name
            for x in entry.from.x...entry.to.x { // swiftlint:disable:this identifier_name
                let coordinate = Coordinate(x: x, y: y)
                switch entry.action {
                case .turnOff:
                    lightsOn.remove(coordinate)
                case .turnOn:
                    lightsOn.insert(coordinate)
                case .toggle:
                    if lightsOn.contains(coordinate) {
                        lightsOn.remove(coordinate)
                    } else {
                        lightsOn.insert(coordinate)
                    }
                }
            }
        }
    }

    return lightsOn.count
}

public func algorithm2(input: [Entry]) -> Int {
    var grid: [Coordinate: Int] = [:]

    for entry in input {
        for y in entry.from.y...entry.to.y { // swiftlint:disable:this identifier_name
            for x in entry.from.x...entry.to.x { // swiftlint:disable:this identifier_name
                let coordinate = Coordinate(x: x, y: y)
                let currentValue = grid[coordinate, default: 0]

                switch entry.action {
                case .turnOff:
                    if currentValue > 0 {
                        grid.updateValue(currentValue - 1, forKey: coordinate)
                    }
                case .turnOn:
                    grid.updateValue(currentValue + 1, forKey: coordinate)
                case .toggle:
                    grid.updateValue(currentValue + 2, forKey: coordinate)
                }
            }
        }
    }

    return grid.values.reduce(0, +)
}
