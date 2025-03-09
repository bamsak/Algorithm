let mnk = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n, k) = (mnk[0], mnk[1], mnk[2])
var rectangle = Array(repeating: Array(repeating: false, count: n), count: m)

for _ in 0..<k {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (xy[0], xy[1], xy[2], xy[3])
    for i in y1..<y2 {
        for j in x1..<x2 {
            rectangle[i][j] = true
        }
    }
}

var count = 0
var area = [Int]()
var stack = [(x: Int, y: Int)]()
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for y in 0..<m {
    for x in 0..<n where !rectangle[y][x] {
        count += 1
        var temp = 0
        stack.append((x, y))
        rectangle[y][x] = true
        
        while let current = stack.popLast() {
            temp += 1
            for i in 0..<dx.count {
                let newX = current.x + dx[i]
                let newY = current.y + dy[i]
                
                if newX >= n || newX < 0 || newY >= m || newY < 0 { continue }
                if rectangle[newY][newX] { continue }
                stack.append((newX, newY))
                rectangle[newY][newX] = true
            }
        }
        
        area.append(temp)
    }
}

print(count)
print(area.sorted().map { String($0) }.joined(separator: " "))
