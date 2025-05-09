
var result = ""

for _ in 0..<Int(readLine()!)! {
  let nm = readLine()!.split(separator: " ").map { Int($0)! }
  let (n, m) = (nm[0], nm[1])
  var edges = Array(repeating: Array(repeating: 0, count: 0), count: n)
  var colors = [Int](repeating: -1, count: n)
  
  for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (u, v) = (uv[0], uv[1])
    edges[u].append(v)
    edges[v].append(u)
  }
  
  var trigger = true
  
  func dfs(_ node: Int, _ color: Int) {
    colors[node] = color
  
    for edge in edges[node] {
      if colors[edge] == -1 {
        dfs(edge, color == 0 ? 1 : 0)
        continue
      }
      
      if colors[edge] == color {
        trigger = false
        return
      }
    }
  } 


  for i in 0..<n {
    if colors[i] == -1 {
      dfs(i, 0)  
    }
    if !trigger { break }
  }
  
  
  result += "\(trigger ? "possible" : "impossible")\n"

}
print(result)
