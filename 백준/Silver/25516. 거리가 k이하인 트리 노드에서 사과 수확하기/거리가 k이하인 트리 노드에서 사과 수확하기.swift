let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)
for _ in 0..<n - 1 {
    let pc = readLine()!.split(separator: " ").map { Int($0)! }
    edges[pc[0]].append(pc[1])
    edges[pc[1]].append(pc[0])
}

let apples = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Array(repeating: false, count: n)
var result = 0

func dfs(_ current: Int, _ depth: Int) {
    visited[current] = true
    if depth > k {
        return
    }
    
    if depth <= k && apples[current] == 1{
        result += 1
    }
    
    for edge in edges[current] where !visited[edge] {
        dfs(edge, depth + 1)
    }
}

dfs(0, 0)

print(result)