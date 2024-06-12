let n = Int(readLine()!)!
let budgets = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!

var left = 0
var right = budgets.max()!
var mid = (left + right) / 2

while left <= right {
    let total = budgets.reduce(0){ $0 + ($1 < mid ? $1 : mid) }
    
    if total <= m {
        left = mid + 1
    } else {
        right = mid - 1
    }
    
    mid = (left + right) / 2
}

print(mid)
