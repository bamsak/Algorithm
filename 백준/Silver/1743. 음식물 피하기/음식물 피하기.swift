let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var edges = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)

for _ in 0..<k {
    let rc = readLine()!.split(separator: " ").map { Int($0)! }
    let (r, c) = (rc[0], rc[1])
    edges[r][c] = true
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var size = 0
var stack = [(x: Int, y: Int)]()

for y in 1...n {
    for x in 1...m where edges[y][x] {
        var currentSize = 0
        stack.append((x, y))
        edges[y][x] = false
        while !stack.isEmpty {
            let now = stack.removeLast()
            currentSize += 1
            
            for i in 0..<dx.count {
                let newX = now.x + dx[i]
                let newY = now.y + dy[i]
                
                if newX > m || newY > n || newX < 0 || newY < 0 { continue }
                if !edges[newY][newX] { continue }
                
                stack.append((newX,newY))
                edges[newY][newX] = false
            }
        }
        size = max(size, currentSize)
    }
}
print(size)