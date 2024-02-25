let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2])

var visited = [Bool](repeating: false, count: n + 1)
var edges = [[Int]](repeating: [], count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    edges[uv[0]].append(uv[1])
    edges[uv[1]].append(uv[0])
}

for i in 1...n {
    edges[i] = edges[i].sorted()
}

var count = 0
var result = [Int](repeating: 0, count: n + 1)

func dfs(_ vertex: Int) {
    if visited[vertex] == true {
        return
    }
    visited[vertex] = true
    count += 1
    result[vertex] = count
    
    for edge in edges[vertex] {
        if visited[edge] == false {
            dfs(edge)
        }
    }
}
dfs(r)
result[1...n].forEach { print($0, terminator: "\n") }