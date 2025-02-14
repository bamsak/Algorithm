let n = Int(readLine()!)!
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)
var visited = Array(repeating: false, count: n)

for _ in 0..<n - 1{
    let pc = readLine()!.split(separator: " ").map { Int($0)! }
    let (p, c) = (pc[0], pc[1])
    edges[p].append(c)
    edges[c].append(p)
}

var cost = [(w: Int, b: Int)]()

for _ in 0..<n {
    let wb = readLine()!.split(separator: " ").map { Int($0)! }
    let (w, b) = (wb[0], wb[1])
    cost.append((w, b))
}

func dfs(_ node: Int) {
    visited[node] = true
    
    for edge in edges[node] where !visited[edge] {
        dfs(edge)
        cost[node].w += cost[edge].b
        cost[node].b += cost[edge].w
    }
}

dfs(0)

print(min(cost[0].w, cost[0].b))
