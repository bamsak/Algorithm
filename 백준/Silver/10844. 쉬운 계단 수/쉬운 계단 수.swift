let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: 101)

for i in 1..<10 {
  dp[1][i] = 1
}

for i in 2..<101 {
  for j in 0..<10 {
    switch j {
      case 0:
      dp[i][0] = dp[i - 1][1] % 1_000_000_000
      case 9:
      dp[i][9] = dp[i - 1][8] % 1_000_000_000
      default:
      dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1_000_000_000
    }
  }
}

print(dp[n].reduce(0, +) % 1_000_000_000)