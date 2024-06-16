let kn = readLine()!.split(separator: " ").map { Int($0)! }
let (k, n) = (kn[0], kn[1])
var lines = [Int]()

for _ in 0..<k {
    lines.append(Int(readLine()!)!)
}

var left = 1
var right = lines.max()!

while left <= right {
    let mid = (left + right) / 2
    let temp = lines.map { $0 / mid }.reduce(0, +)
    
    if temp < n {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(right)