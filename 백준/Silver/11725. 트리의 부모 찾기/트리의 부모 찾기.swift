let n = Int(readLine()!)!
var trees = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<n - 1 {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    trees[xy[0]].append(xy[1])
    trees[xy[1]].append(xy[0])
}

var result = Array(repeating: 0, count: n + 1)
var stack = [(node: Int, parent: Int)](repeating: (0, 0), count: n + 1)

stack.append((1, 0))

while !stack.isEmpty {
    let current = stack.removeLast()
    
    visited[current.node] = true
    result[current.node] = current.parent
    
    for tree in trees[current.node] {
        if !visited[tree] {
            stack.append((tree, current.node))
        }
    }
}

result[2...].forEach{ print($0,separator:" ") }