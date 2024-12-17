let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var times = [Int]()

for _ in 0..<n {
    times.append(Int(readLine()!)!)
}

var diff = [Int]()

for i in 0..<n - 1 {
    diff.append(abs(times[i] - times[i + 1]))
}

diff.sort()
var result = 0

for i in 0..<n - k {
    result += diff[i]
}

result += k

print(result)