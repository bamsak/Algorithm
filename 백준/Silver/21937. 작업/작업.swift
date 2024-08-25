let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    edges[b].append(a)
}

let x = Int(readLine()!)!
var stack = [Int]()

stack.append(x)

var visited = Array(repeating: false, count: n + 1)
var result = 0
while !stack.isEmpty {
    let current = stack.removeLast()
    
    for edge in edges[current] where !visited[edge] {
        visited[edge] = true
        stack.append(edge)
        result += 1
    }
}
print(result)