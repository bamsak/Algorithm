let mn = readLine()!.split(separator: " ").map { Int($0)!}
let (m, n) = (mn[0], mn[1])

var board = Array(repeating: Array(repeating: 0, count: 0), count: m)

for i in 0..<m {
    board[i] = readLine()!.map { Int(String($0))! }
}

var visited = Array(repeating: Array(repeating: false, count: n), count: m)
var stack = [(x: Int, y: Int)]()

for x in 0..<board[0].count where board[0][x] == 0 {
    stack.append((x, 0))
    visited[0][x] = true
}
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var result = "NO"

while !stack.isEmpty {
    let current = stack.removeLast()
    if current.y == m - 1 {
        result = "YES"
        break
    }
    
    for i in 0..<dx.count {
        let newX = current.x + dx[i]
        let newY = current.y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= n || newY >= m { continue }
        if visited[newY][newX] || board[newY][newX] == 1 { continue }
        visited[newY][newX] = true
        stack.append((newX, newY))
    }
}

print(result)