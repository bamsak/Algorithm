let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])
let snacks = readLine()!.split(separator: " ").map { Int($0)! }

var left = 1
var right = snacks.max()!

while left <= right {
    let mid = (left + right) / 2
    
    let temp = snacks.map { $0 / mid }.reduce(0, +)
    
    if temp < m {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(right)