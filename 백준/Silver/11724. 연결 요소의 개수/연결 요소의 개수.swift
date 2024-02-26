let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var visited = [Bool](repeating: false, count: n + 1)
var edges = [[Int]](repeating: [], count: n + 1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    edges[uv[0]].append(uv[1])
    edges[uv[1]].append(uv[0])
}

var count = 0
if m == 0 {
    print(n)
} else {
    for i in 1...n {
        if visited[i] == true {
            continue
        }
        dfs(i)
        count += 1
    }
    print(count)
}

func dfs(_ vertex: Int) {
    if visited[vertex] == true {
        return
    }
    visited[vertex] = true
    for edge in edges[vertex] {
        if visited[edge] == false {
            dfs(edge)
        }
    }
}