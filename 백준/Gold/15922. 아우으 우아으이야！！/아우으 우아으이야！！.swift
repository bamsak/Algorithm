let n = Int(readLine()!)!
let temp = readLine()!.split(separator: " ").map { Int($0)! }
var previous = (x: temp[0], y: temp[1])
var result = previous.y - previous.x

for _ in 0..<n - 1 {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y) = (xy[0], xy[1])
    
    if x >= previous.x && y <= previous.y { continue }
    
    if previous.y < x {
        previous = (x, y)
        result += y - x
        continue
    }
    
    if previous.y == x {
        result += y - x
        previous.y = y
        continue
    }
    
    result += y - previous.y
    previous.y = y
}

print(result)
