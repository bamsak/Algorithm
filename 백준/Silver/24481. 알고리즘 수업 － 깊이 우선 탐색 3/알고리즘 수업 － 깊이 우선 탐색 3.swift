let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2])
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var visited = Array(repeating: -1, count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    edges[uv[0]].append(uv[1])
    edges[uv[1]].append(uv[0])
}

func dfs(_ node: Int, _ depth: Int) {
    visited[node] = depth
    
    for edge in edges[node].sorted() where visited[edge] == -1 {
        dfs(edge, depth + 1)
    }
}
dfs(r, 0)

visited[1...].forEach { print($0) }