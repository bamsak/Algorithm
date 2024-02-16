let ab = readLine()!.split(separator: " ").map { Int($0)! }
let setA = Set(readLine()!.split(separator: " ").map { Int($0)! })
let setB = Set(readLine()!.split(separator: " ").map { Int($0)! })
let sub = setA.subtracting(setB).map { $0 }.sorted()

print(sub.count)
sub.forEach { print($0, terminator: " ") }
