import Foundation

let file = "day-1/input"
let url = URL(fileURLWithPath: file)
let data = try Data(contentsOf: url)
let input = String(decoding: data, as: UTF8.self)
let readings = input.split(separator: "\n").map { Int($0)! }
print(readings.enumerated().filter { i, reading in
    if i < 1 { return false }
    let previous = readings[i - 1]
    return reading > previous
}.count)

print(readings.enumerated().filter { i, reading in
    if i < 4 { return false }
    let previousWindow = readings[i - 3...i - 1].reduce(0, +)
    let thisWindow = readings[i - 2...i].reduce(0, +)
    return thisWindow > previousWindow
}.count)
