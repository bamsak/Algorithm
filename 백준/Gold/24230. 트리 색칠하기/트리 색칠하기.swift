let n = Int(readLine()!)!
let colors = readLine()!.split(separator: " ").map { Int($0)! }
var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)

for _ in 0..<n - 1 {
  let uv = readLine()!.split(separator: " ").map { Int($0)! - 1 }
  edges[uv[0]].append(uv[1])
  edges[uv[1]].append(uv[0])
}

var visited = [Bool](repeating: false, count: n)
var result = colors[0] == 0 ? 0 : 1

func dfs(_ node: Int) {
  visited[node] = true
  
  for edge in edges[node] where !visited[edge] {
      if colors[node] != colors[edge] {
         result += 1
      }
      dfs(edge)
  }
}

dfs(0)

print(result)