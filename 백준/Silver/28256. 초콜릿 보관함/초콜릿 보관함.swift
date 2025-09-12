let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for _ in 0..<Int(readLine()!)! {
  var map = [[String]]()
  var visited = Array(repeating: Array(repeating: false, count: 3), count: 3)
  
  var starts = [(x: Int, y: Int)]()
  for y in 0..<3 {
    let input = readLine()!.map { String($0) }
    
    for x in 0..<3 {
      if input[x] == "O" {
        starts.append((x, y))
      }
    }
    
    map.append(input)
  }
  
  func dfs(_ x: Int,_ y: Int,_ count: inout Int) {
    visited[y][x] = true
    count += 1
    for i in 0..<dx.count {
      let newX = x + dx[i]
      let newY = y + dy[i]
      
      if newX < 0 || newX >= 3 || newY < 0 || newY >= 3 {
        continue
      }
      
      if visited[newY][newX] || map[newY][newX] != "O" { continue }
      
      dfs(newX, newY, &count)
    }
  
  }
  
  let na = readLine()!.split(separator: " ").map { Int($0)! }
  let n = na[0]
  let nums = n > 0 ? Array(na[1...]) : []
  var arr = [Int]()
  
  for s in starts where !visited[s.y][s.x] {
    var count = 0
    dfs(s.x, s.y, &count)
    arr.append(count)
  }
  arr.sort()
  arr == nums ? print(1) : print(0)

}