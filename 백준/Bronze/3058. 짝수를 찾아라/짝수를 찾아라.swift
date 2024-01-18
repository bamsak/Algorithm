let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let evens = readLine()!.split(separator: " ").map { Int($0)! }.filter { $0 % 2 == 0 }.sorted()
    let sum = evens.reduce(0, +)
    result.append("\(sum) \(evens.first!)\n")
}
print(result)
