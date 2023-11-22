let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var trees = readLine()!.split(separator: " ").map{ Int($0)! }

var left = 1
var right = trees.max()!

while left <= right {
    var mid = (left + right) / 2
    
    var length = 0
    
    for tree in trees {
        if tree > mid {
            length += tree - mid
        }
    }
    
    if length < m {
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print("\(right)")
