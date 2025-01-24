let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let pays = readLine()!.split(separator: " ").map { Int($0)! }
var psum = [Int](repeating: 0, count: n + 1)

for i in 1...n {
    psum[i] = psum[i - 1] + pays[i - 1]
}

var result = 0

for i in m...n {
    result = max(result, psum[i] - psum[i - m])
}

print(result)