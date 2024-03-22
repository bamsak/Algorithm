let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let exp = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = 0
var t = 0

for i in 0..<n {
    result += exp[i] * t
    if t < k {
        t += 1
    }
}

print(result)