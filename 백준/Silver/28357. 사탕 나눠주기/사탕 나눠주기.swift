let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let scores = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = scores.max()!

while left <= right {
    let mid = (left + right) / 2
    let temp = scores.map { $0 > mid ? $0 - mid : 0 }.reduce(0, +)

    if temp <= k {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(left)