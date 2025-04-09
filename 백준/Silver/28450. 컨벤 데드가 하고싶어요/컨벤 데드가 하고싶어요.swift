let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var map = [[Int]]()

for _ in 0..<n {
  map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let h = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: Int.max, count: m + 1), count: n + 1)

dp[1][1] = map[0][0]

for i in 1...n {
  for j in 1...m {
    let prevUp = dp[i - 1][j] == Int.max ? Int.max : dp[i - 1][j] + map[i - 1][j - 1]
    let prevLeft = dp[i][j - 1] == Int.max ? Int.max : dp[i][j - 1] + map[i - 1][j - 1]
    dp[i][j] = min(dp[i][j], prevUp, prevLeft)
  }
}

dp[n][m] > h ? print("NO") : print("YES\n\(dp[n][m])")
