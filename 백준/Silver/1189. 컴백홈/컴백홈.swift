let rck = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c, k) = (rck[0], rck[1], rck[2])
var map = Array(repeating: Array(repeating: "", count: 0), count: r)

for y in 0..<r {
    map[y] = readLine()!.map { String($0) }
}

var visited = Array(repeating: Array(repeating: false, count: c), count: r)

var result = 0

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

func dfs(_ x: Int, _ y: Int, _ distance: Int) {
    if x == c - 1 && y == 0 {
        if distance == k {
            result += 1
        }
        return
    }
    
    for i in 0..<dx.count {
        let newX = x + dx[i]
        let newY = y + dy[i]
        
        if newX < 0 || newY < 0 || newX >= c || newY >= r { continue }
        if visited[newY][newX] || map[newY][newX] == "T" { continue }
        visited[newY][newX] = true
        dfs(newX, newY, distance + 1)
        visited[newY][newX] = false
    }
}

visited[r-1][0] = true
dfs(0, r - 1, 1)

print(result)