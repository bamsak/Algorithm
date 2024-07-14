let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var edges = Array(repeating: Array(repeating: (vertex: 0, weight: 0), count: 0),count: n + 1)

for _ in 0..<n - 1 {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    edges[a].append((b, c))
    edges[b].append((a, c))
}

for _ in 0..<m {
    var visited = Array(repeating: false, count: n + 1)
    var stack = [(vertex: Int, weight: Int)]()
    let se = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end) = (se[0], se[1])
 
    stack.append((start, 0))
    visited[start] = true
    
    while !stack.isEmpty {
        let current = stack.removeLast()
        
        if current.vertex == end {
            print(current.weight)
            break
        }
        
        for edge in edges[current.vertex] where !visited[edge.vertex] {
            visited[edge.vertex] = true
            stack.append((edge.vertex, current.weight + edge.weight))
        }
    }
}
