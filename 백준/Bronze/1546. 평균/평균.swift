let n = Float(readLine()!)!
let scores = readLine()!.split(separator: " ").map { Float($0)! }
let result = scores.map { $0 / scores.max()! * 100 }.reduce(0, +) / n
print(result)