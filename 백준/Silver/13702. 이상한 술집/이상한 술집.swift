let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var mags = [Int]()

for _ in 0..<n {
    mags.append(Int(readLine()!)!)
}

var left = 0
var right = mags.max()!

while left <= right {
    let mid = (left + right) / 2
    if mid == 0 { break }
    let temp = mags.map { $0 / mid }.reduce(0, +)
    
    if temp < k {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(right)