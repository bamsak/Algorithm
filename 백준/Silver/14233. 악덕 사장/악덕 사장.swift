let n = Int(readLine()!)!
let times = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var left = 1
var right = times[0]

while left <= right {
    let mid = (left + right) / 2
    
    var total = 0
    var trigger = true
    
    for time in times {
        total += mid
        if total > time {
            trigger = false
            break
        }
    }
    
    if trigger {
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(right)