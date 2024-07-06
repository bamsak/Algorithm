let sc = readLine()!.split(separator: " ").map { Int($0)! }
let (s, c) = (sc[0], sc[1])
var array = [Int]()

for _ in 0..<s {
    array.append(Int(readLine()!)!)
}

var left = 1
var right = array.max()!

while left <= right {
    let mid = (left + right) / 2
    
    let temp = array.map { $0 / mid }.reduce(0, +)
    
    if temp < c {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

let result = array.reduce(0, +) - c * right

print(result)