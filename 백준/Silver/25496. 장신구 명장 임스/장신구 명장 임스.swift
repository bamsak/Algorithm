let pn = readLine()!.split(separator: " ").map { Int($0)! }
var (p, n) = (pn[0], pn[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = 0

for i in 0..<n where p < 200 {
    p += arr[i]
    result += 1
}

print(result)
