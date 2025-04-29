let nmh = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, h) = (nmh[0], nmh[1], nmh[2])

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var map = [[Int]]()

var start = (x: -1, y: -1)
var mint = [(x: Int, y: Int)]()

for y in 0..<n {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  map.append(input)
  
  for x in 0..<n {
    if input[x] == 1 {
      start = (x, y)
    } else if input[x] == 2 {
      mint.append((x, y))
    }
  }
}

var result = 0
var visited = [Bool](repeating: false, count: mint.count)
func dfs(_ x: Int, _ y: Int, _ jh: Int, _ count: Int) {
  
  for i in 0..<mint.count where !visited[i] {
    let hp = abs(mint[i].x - x) + abs(mint[i].y - y)
    if jh < hp { continue }
    visited[i] = true
    dfs(mint[i].x, mint[i].y, jh - hp + h, count + 1)
    visited[i] = false
  }
  
  if canComeback(abs(start.x - x) + abs(start.y - y), jh) {
    result = max(result, count)
  }
}

func canComeback(_ distance: Int, _ jh: Int) -> Bool {
  return distance <= jh
}

dfs(start.x, start.y, m, 0)

print(result)