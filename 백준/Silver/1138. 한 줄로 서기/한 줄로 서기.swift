let n = Int(readLine()!)!
let line = readLine()!.split(separator: " ").map { Int($0)! }
var result = [Int](repeating: 0, count: n)

for i in 0..<n {
    var count = 0
    for j in 0..<n {
        if result[j] != 0 { continue }
        if count == line[i] {
            result[j] = i + 1
            break
        }
        count += 1
    }
}

print(result.map { String($0) }.joined(separator: " "))