var map = [[Int]]()

for _ in 0..<5 {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (rc[0], rc[1])

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
var result = 0

func dfs(_ x: Int, _ y: Int, _ apple: Int, _ count: Int) {
    if count > 3 {
        return
    }
    
    if apple >= 2 {
        result = 1
        return
    }
    
    for i in 0..<4 {
        let newX = x + dx[i]
        let newY = y + dy[i]
        
        if newX < 0 || newX >= 5 || newY < 0 || newY >= 5 { continue }
        if map[newY][newX] == -1 || visited[newY][newX] { continue }
        let newApple = map[newY][newX] == 1 ? apple + 1 : apple
        
        visited[newY][newX] = true
        dfs(newX, newY, newApple, count + 1)
        visited[newY][newX] = false
    }
}

visited[r][c] = true
dfs(c, r, 0, 0)

print(result)
