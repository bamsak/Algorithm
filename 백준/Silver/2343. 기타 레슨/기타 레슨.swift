let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let lessons = readLine()!.split(separator: " ").map { Int($0)! }

var left = lessons.max()!
var right = lessons.reduce(0, +)

while left <= right {
    let mid = (left + right) / 2
    var temp = mid
    var count = 1
    
    for lesson in lessons {
        if temp < lesson {
            count += 1
            temp = mid
        }
        temp -= lesson
    }
    
    if count <= m {
        right = mid - 1
    } else {
        left = mid + 1
    }
}


print(left)