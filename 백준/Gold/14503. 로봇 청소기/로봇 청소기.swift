let nm = readLine()!.split(separator: " ").map { Int($0)! }
let rcd = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let (r, c, d) = (rcd[0], rcd[1], rcd[2])
var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var result = 0

func turnLeft(_ d: Int) -> Int {
    return (d + 3) % 4
}

func dfs(_ x: Int, _ y: Int, _ d: Int) {
    if !visited[x][y] {
        visited[x][y] = true
        result += 1
    }
    
    var currD = d
    
    for _ in 0..<4 {
        currD = turnLeft(currD)
        let newX = x + dx[currD]
        let newY = y + dy[currD]
        
        if newX < 0 || newY < 0 || newX >= n || newY >= m { continue }
        if visited[newX][newY] || map[newX][newY] == 1 { continue }
        dfs(newX, newY, currD)
        return
    }
    
    let backD = (currD + 2) % 4
    let backX = x + dx[backD]
    let backY = y + dy[backD]
    
    if map[backX][backY] == 0 {
        dfs(backX, backY, d)
    }
}

dfs(r, c, d)
print(result)