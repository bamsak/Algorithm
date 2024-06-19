let n = Int(readLine()!)!
let m = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int($0)! }

var left = 1
var right = n

while left <= right {
    let mid = (left + right) / 2
    var count = 0
    
    for lamp in x {
        if lamp - mid <= count {
            count = lamp + mid
        }
    }
    
    if count < n {
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(left)