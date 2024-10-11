let nmb = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, b) = (nmb[0], nmb[1], nmb[2])

var map = [[Int]]()

var minH = Int.max
var maxH = -1
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
    input.forEach {
        minH = min(minH, $0)
        maxH = max(maxH, $0)
    }
}

var time = Int.max

var height = 0

for h in minH...maxH {
    var t = 0
    var temp = b
    
    for y in 0..<n {
        for x in 0..<m {
            let diff = map[y][x] - h
            
            if diff == 0 { continue }
            
            if diff > 0 {
                t += diff * 2
                temp += diff
            } else {
                t += abs(diff)
                temp -= abs(diff)
            }
        }
    }
    
    if temp < 0 { continue }
    
    if t < time {
        time = t
        height = h
    } else if t == time {
        height = max(height, h)
    }
}

print("\(time) \(height)")
