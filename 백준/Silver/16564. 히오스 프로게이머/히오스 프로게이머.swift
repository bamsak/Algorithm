
let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var levels = [Int]()

for _ in 0..<n {
    let level = Int(readLine()!)!
    levels.append(level)
}

var left = 1
var right = levels.max()! + k

while left <= right {
    let mid = (left + right) / 2
    
    var count = 0
    
    for level in levels {
        if mid - level > 0 {
            count += mid - level
        }
    }
    
    if k < count {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print("\(right)")
