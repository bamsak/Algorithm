let n = Int(readLine()!)!
var edges = [Int](repeating: 0, count: n + 1)

for i in 1...n {
  edges[i] = Int(readLine()!)!
}


var temp = [Int](repeating: 0, count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)

for i in 1...n {
  dfs(i)
  temp[i] = visited.filter { $0 }.count
  visited = [Bool](repeating: false, count: n + 1)
}

func dfs(_ idx: Int) {
  visited[idx] = true
  
  let edge = edges[idx]
  if !visited[edge] {
    dfs(edge)
  }
}

let m = temp.max()!
print(temp.firstIndex(of: m)!)