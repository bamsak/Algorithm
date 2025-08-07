let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<m {
  let ab = readLine()!.split(separator: " ").map { Int($0)! }
  let (a, b) = (ab[0], ab[1])
  
  edges[a].append(b)
  edges[b].append(a)
}

var result = false

for i in 0..<n {
  if result { break }
  var visited = [Bool](repeating: false, count: n)
  dfs(1, i, &visited)
}

func dfs(_ depth: Int, _ current: Int, _ visited: inout [Bool]) {
  visited[current] = true
  
  if depth == 5 {
    result = true
    return
  }
  
  for edge in edges[current] where !visited[edge] {
    dfs(depth + 1, edge, &visited)
  }
  
  visited[current] = false
}

print(result ? 1 : 0)