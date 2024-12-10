let (n, m) = (Int(readLine()!)!, Int(readLine()!)!)
var map = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)

for _ in 0..<m {
    let uvd = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, d) = (uvd[0], uvd[1], uvd[2])
    map[u][v] = max(map[u][v], d)
}

var result = -1
var visited = Array(repeating: false, count: n + 1)

func dfs(_ depth: Int, _ weight: Int, _ current: Int) {
    if depth == n {
        if map[current][0] != -1 {
            result = max(result, weight + map[current][0])
        }
        return
    }
    
    for i in 1...n where !visited[i] && map[current][i] != -1 {
        visited[i] = true
        dfs(depth + 1, weight + map[current][i], i)
        visited[i] = false
    }
}

visited[0] = true
dfs(0, 0, 0)

print(result)