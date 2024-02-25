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
    edges[i] = edges[i].sorted(by: >)
}

var count = 0
var result = [Int](repeating: 0, count: n + 1)
var stack = [r]

while stack.isEmpty == false {
    let vertex = stack.removeLast()
    if visited[vertex] == true {
        continue
    }
    visited[vertex] = true
    count += 1
    result[vertex] = count
    
    for edge in edges[vertex] {
        if visited[edge] == false {
            stack.append(edge)
        }
    }
}
print(result[1...].map { "\($0)"}.joined(separator: "\n"))
