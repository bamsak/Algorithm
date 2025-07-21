let n = Int(readLine()!)!

var edges = Array(repeating: Array(repeating: 0, count: 0), count: 26)

for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map { String($0) }
  let (a, b) = (Int(String(Character(input[0]).asciiValue! - 97))!, Int(String(Character(input[2]).asciiValue! - 97))!)
  
  edges[a].append(b)
}

var visited = Array(repeating: Array(repeating: false, count: 26), count: 26)

func dfs(_ node: Int, _ now: Int) {
  visited[now][node] = true
  
  for edge in edges[node] {
    if !visited[now][edge] {
      dfs(edge, now)
    }
  }
}

for i in 0..<26 {
  dfs(i, i)
}

for _ in 0..<Int(readLine()!)! {
  let input = readLine()!.split(separator: " ").map { String($0) }
  let (a, b) = (Int(String(Character(input[0]).asciiValue! - 97))!, Int(String(Character(input[2]).asciiValue! - 97))!)
  
  visited[a][b] ? print("T") : print("F")
}