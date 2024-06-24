let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var jewels = [Int]()

for _ in 0..<m {
    jewels.append(Int(readLine()!)!)
}

var left = 1
var right = jewels.max()!

while left <= right {
    let mid = (left + right) / 2
    let count = jewels.map {
        if $0 % mid != 0 {
            return $0 / mid + 1
        }
        return $0 / mid
    }.reduce(0, +)
    
    if count <= n {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(left)