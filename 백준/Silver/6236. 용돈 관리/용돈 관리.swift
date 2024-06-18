let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var moneys = [Int]()

for _ in 0..<n {
    moneys.append(Int(readLine()!)!)
}

var left = moneys.max()!
var right = moneys.reduce(0, +)

while left <= right {
    let mid = (left + right) / 2
    var count = 0
    var temp = 0
    
    for money in moneys {
        if money > temp {
            count += 1
            temp = mid
        }
        temp -= money
    }
    
    if count <= m {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(left)