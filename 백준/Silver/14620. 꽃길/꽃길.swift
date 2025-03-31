let n = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  map.append(input)
}

var visited = Array(repeating: Array(repeating: false, count: n), count: n)

var result = Int.max

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]


func check(_ x: Int, _ y: Int) -> Bool {
  for i in 0..<4 {
    let newX = x + dx[i]
    let newY = y + dy[i]
    
    if newX < 0 || newX >= n || newY < 0 || newY >= n { false }
    if visited[newY][newX] { return false }
  }
  
  return true
}


func dfs(_ count: Int, _ cost: Int) {
  if count == 3 {
    result = min(cost, result)
    return
  }
  
  for y in 1..<n-1 {
    for x in 1..<n-1 where check(x, y) && !visited[y][x] {
      var current = map[y][x]
      visited[y][x] = true
      for i in 0..<4 {
        let newX = x + dx[i]
        let newY = y + dy[i]
        
        current += map[newY][newX]
        visited[newY][newX] = true
      }
      
      dfs(count + 1, cost + current)
      
      for i in 0..<4 {
        let newX = x + dx[i]
        let newY = y + dy[i]
        
        visited[newY][newX] = false
      }
      visited[y][x] = false
    }
  }
}

dfs(0, 0)
print(result)