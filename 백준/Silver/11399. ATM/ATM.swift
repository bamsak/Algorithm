let n = Int(readLine()!)!
let p = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = [Int](repeating: 0, count: n)

for i in 0..<n {
    if i == 0 {
        result[i] = p[i]
        continue
    }
    result[i] = result[i - 1] + p[i]
}

print(result.reduce(0, +))