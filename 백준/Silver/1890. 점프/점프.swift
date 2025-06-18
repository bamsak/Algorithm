let n = Int(readLine()!)!

var map = [[Int]]()

for _ in 0..<n {
  map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
dp[0][0] = 1

let dx = [1, 0]
let dy = [0, 1]

for y in 0..<n {
  for x in 0..<n {
    for i in 0..<2 {
      if dp[y][x] == 0 || map[y][x] == 0 {
        continue
      }
      let newX = x + (dx[i] * map[y][x])
      let newY = y + (dy[i] * map[y][x])
      
      if newX >= n || newY >= n {
        continue
      }
      
      dp[newY][newX] += dp[y][x]
    }
  }
}

print(dp[n - 1][n - 1])