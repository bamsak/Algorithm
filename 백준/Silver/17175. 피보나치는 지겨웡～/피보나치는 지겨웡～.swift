let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 51)
dp[0] = 1
dp[1] = 1

for i in 2...50 {
  dp[i] = (dp[i - 1] + dp[i - 2] + 1) % 1_000_000_007
}

print(dp[n])