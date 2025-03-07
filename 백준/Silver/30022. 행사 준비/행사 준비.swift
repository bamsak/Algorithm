let nab = readLine()!.split(separator: " ").map { Int($0)! }
let (n, a, b) = (nab[0], nab[1], nab[2])

var diff = [Int]()
var totalB = 0
for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    diff.append(ab[0] - ab[1])
    totalB += ab[1]
}

diff.sort()

for i in 0..<a {
    totalB += diff[i]
}

print(totalB)
