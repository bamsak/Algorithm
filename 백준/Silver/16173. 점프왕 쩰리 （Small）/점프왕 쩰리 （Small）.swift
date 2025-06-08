var map = [[Int]]()
let n = Int(readLine()!)!

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var stack = [(x: Int, y: Int)]()

visited[0][0] = true
stack.append((0, 0))

let dx = [0, 1]
let dy = [1, 0]

while let current = stack.popLast() {
    if current.x == n-1 && current.y == n-1 {
        break
    }
    
    for i in 0..<2 {
        let newX = dx[i] * map[current.y][current.x] + current.x
        let newY = dy[i] * map[current.y][current.x] + current.y
        
        if newX >= n || newY >= n || visited[newY][newX] { continue }
        visited[newY][newX] = true
        stack.append((newX, newY))
    }
}

print(visited[n-1][n-1] ? "HaruHaru" : "Hing")
