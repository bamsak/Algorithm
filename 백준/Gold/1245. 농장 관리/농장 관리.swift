let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dx = [0, 1, 0, -1, 1, -1, 1, -1]
let dy = [1, 0, -1, 0, 1, -1, -1, 1]
var result = 0
for y in 0..<n {
    for x in 0..<m where map[y][x] != 0 && !visited[y][x] {
        var trigger = false
        dfs(x, y, &trigger)
        if !trigger {
            result += 1
        }
    }
}

func dfs(_ x: Int, _ y: Int, _ trigger: inout Bool) {
    visited[y][x] = true
    
    for i in 0..<dx.count {
        let newX = x + dx[i]
        let newY = y + dy[i]
        if newX < 0 || newY < 0 || newX >= m || newY >= n { continue }
        if map[newY][newX] > map[y][x] {
            trigger = true
        }
        if visited[newY][newX] { continue }
        if map[newY][newX] == map[y][x] {
            dfs(newX, newY, &trigger)
        }
    }
}

print(result)
