let nc = readLine()!.split(separator: " ").map { Int($0)! }
let (n, c) = (nc[0], nc[1])
var house = [Int]()

for _ in 0..<n {
    house.append(Int(readLine()!)!)
}

house.sort()

var left = 1
var right = house.last! - house.first!

while left <= right {
    let mid = (left + right) / 2
    var count = 1
    var temp = house.first!
    
    for h in house {
        if h - temp >= mid {
            count += 1
            temp = h
        }
    }
    
    if count < c {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(right)
