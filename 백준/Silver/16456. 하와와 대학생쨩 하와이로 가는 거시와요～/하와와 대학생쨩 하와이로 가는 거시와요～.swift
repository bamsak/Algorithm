let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: max(4, n) + 1)
dp[1] = 1
dp[2] = 1
dp[3] = 2

for i in 4...max(4, n) {
  dp[i] = (dp[i - 3] + dp[i - 1]) % 1_000_000_009
}

print(dp[n])