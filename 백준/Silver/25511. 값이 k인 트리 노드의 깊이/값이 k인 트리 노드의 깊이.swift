let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<n - 1 {
    let pc = readLine()!.split(separator: " ").map { Int($0)! }
    let (p, c) = (pc[0], pc[1])
    edges[p].append(c)
    edges[c].append(p)
}
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Array(repeating: false, count: n)
var stack = [(idx: Int, depth: Int)]()

visited[0] = true
stack.append((0, 0))

while !stack.isEmpty {
    let current = stack.removeLast()
    if nums[current.idx] == k {
        print(current.depth)
        break
    }
    
    for edge in edges[current.idx] where !visited[edge] {
        visited[edge] = true
        stack.append((edge, current.depth + 1))
    }
}