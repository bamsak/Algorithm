let n = Int(readLine()!)!
var potatos = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let half = n / 2

print("\(potatos[..<half].reduce(0, +)) \(potatos[half...].reduce(0, +))")