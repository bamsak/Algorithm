let n = Int(readLine()!)!
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<n - 1 {
    let pc = readLine()!.split(separator: " ").map { Int($0)! },
    (p, c) = (pc[0], pc[1])
    edges[p].append(c)
    edges[c].append(p)
}

let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = nums
var visited = [Bool](repeating: false, count: n)

func dfs(_ node: Int) {
    visited[node] = true
    
    for edge in edges[node] where !visited[edge] {
        dfs(edge)
        dp[node] = max(dp[node] + dp[edge], dp[node])
    }
}

dfs(0)

print(dp[0])