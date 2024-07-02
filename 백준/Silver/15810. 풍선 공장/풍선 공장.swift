let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let times = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = times.min()! * m

while left <= right {
    let mid = (left + right) / 2
    var temp = 0
    
    for time in times {
        temp += mid / time
    }
    
    if m <= temp {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(left)