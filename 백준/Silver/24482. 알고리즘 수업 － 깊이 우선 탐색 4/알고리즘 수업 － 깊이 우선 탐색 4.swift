let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2])

var edges = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (uv[0], uv[1])
    edges[u].append(v)
    edges[v].append(u)
}

var result = Array(repeating: -1, count: n + 1)
result[r] = 0

func dfs(_ node: Int, _ depth: Int) {
    visited[node] = true
    result[node] = depth
    
    for edge in edges[node].sorted(by: >) where !visited[edge] {
        visited[edge] = true
        dfs(edge, depth + 1)
    }
}

dfs(r, 0)

result[1...].forEach {
    print($0)
}