let n = Int(readLine()!)!
var edges = Array(repeating: Array(repeating: (node: 0, weight: 0), count: 0), count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<n - 1 {
    let pcw = readLine()!.split(separator: " ").map { Int($0)! }
    let (p, c, w) = (pcw[0], pcw[1], pcw[2])
    edges[p].append((c, w))
    edges[c].append((p, w))
}

var stack = [(node: Int, weight: Int)]()
stack.append((1, 0))
visited[1] = true

var low = (node: 0, weight: 0)

while !stack.isEmpty {
    let current = stack.removeLast()
    
    if current.weight > low.weight {
        low = current
    }
    
    for edge in edges[current.node] where !visited[edge.node]{
        visited[edge.node] = true
        stack.append((edge.node, current.weight + edge.weight))
    }
}

visited = Array(repeating: false, count: n + 1)
stack.append((low.node, 0))
visited[low.node] = true
while !stack.isEmpty {
    let current = stack.removeLast()
    
    if current.weight > low.weight {
        low = current
    }
    
    for edge in edges[current.node] where !visited[edge.node]{
        visited[edge.node] = true
        stack.append((edge.node, current.weight + edge.weight))
    }
}

print(low.weight)