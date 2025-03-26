var dp = Array(repeating: Array(repeating: 0, count: 3), count: 100_001)
dp[1][0] = 1
dp[2][1] = 1
dp[3] = [1, 1, 1]

for i in 4...100_000 {
  dp[i][0] = (dp[i - 1][1] + dp[i - 1][2]) % 1_000_000_009
  dp[i][1] = (dp[i - 2][0] + dp[i - 2][2]) % 1_000_000_009
  dp[i][2] = (dp[i - 3][0] + dp[i - 3][1]) % 1_000_000_009
}

for _ in 0..<Int(readLine()!)! {
  let n = Int(readLine()!)!
  print(dp[n].reduce(0, +) % 1_000_000_009)
}