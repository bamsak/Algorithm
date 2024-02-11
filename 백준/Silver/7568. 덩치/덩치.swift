let n = Int(readLine()!)!
var arr = [(x: Int, y: Int)]()

for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((xy[0], xy[1]))
}

for a in arr {
    var tier = 1
    
    for j in arr {
        if a.x < j.x && a.y < j.y {
            tier += 1
        }
    }
    print(tier, terminator: " ")
}
