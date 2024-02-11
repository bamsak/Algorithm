let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let b = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var s = 0
for i in 0..<n {
    s += a[i] * b[i]
}
print(s)
