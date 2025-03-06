readLine()
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let sum = arr.reduce(0, +)

print(max(sum, -arr.min()!))