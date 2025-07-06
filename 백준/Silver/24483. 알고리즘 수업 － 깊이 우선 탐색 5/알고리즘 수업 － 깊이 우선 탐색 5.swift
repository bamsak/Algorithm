let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2] - 1)

var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (u, v) = (uv[0], uv[1])
    edges[u].append(v)
    edges[v].append(u)
}


var visited = [Int](repeating: -1, count: n)
var stack = [(node: Int, depth: Int)]()
stack.append((r, 0))

var step = 1
var result = 0

while let current = stack.popLast() {
    if visited[current.node] != -1 { continue }
    
    visited[current.node] = current.depth
    result += current.depth * step
    step += 1
    
    for edge in edges[current.node].sorted(by: >) where visited[edge] == -1 {
        stack.append((edge, current.depth + 1))
    }
}

print(result)
