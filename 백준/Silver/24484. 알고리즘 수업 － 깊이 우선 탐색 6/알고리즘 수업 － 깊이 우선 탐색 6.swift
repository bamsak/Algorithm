let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2] - 1)
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (u, v) = (uv[0], uv[1])

    edges[u].append(v)
    edges[v].append(u)
}

var visited = [Bool](repeating: false, count: n)
var temp = [(depth: Int, turn: Int)](repeating: (-1, 0), count: n)
var t = 1

func dfs(_ node: Int, _ depth: Int) {
    visited[node] = true
    temp[node] = (depth, t)

    for edge in edges[node].sorted(by: >) where !visited[edge] {
        t += 1
        dfs(edge, depth + 1)
    }
}

dfs(r, 0)
var result = 0

for i in 0..<n {
    result += temp[i].depth * temp[i].turn
}

print(result)