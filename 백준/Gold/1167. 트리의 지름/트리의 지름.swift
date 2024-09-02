let v = Int(readLine()!)!
var edges = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: v + 1)

for _ in 0..<v {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    for i in 0..<input[1...].count - 2 where i % 2 == 0 {
        edges[n].append((input[i + 1], input[i + 2]))
    }
}

var visited = Array(repeating: false, count: v + 1)
var l = (node: 0, weight: 0)

func dfs(_ node: Int, _ weight: Int) {
    visited[node] = true
    
    if weight > l.weight {
        l = (node, weight)
    }
    
    for edge in edges[node] where !visited[edge.node] {
        visited[edge.node] = true
        dfs(edge.node, edge.weight + weight)
    }
}

dfs(1, 0)
visited = Array(repeating: false, count: v + 1)
dfs(l.node, 0)

print(l.weight)