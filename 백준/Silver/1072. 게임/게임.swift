let xy = readLine()!.split(separator: " ").map { Int($0)! }
let (x, y) = (xy[0], xy[1])
let z = y * 100 / x

var left = 1
var right = 1_000_000_000

while left <= right {
    let mid = (left + right) / 2
    
    let nx = x + mid
    let ny = y + mid
    let nz = ny * 100 / nx
    
    if nz != z {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(left > 1_000_000_000 ? -1 : left)