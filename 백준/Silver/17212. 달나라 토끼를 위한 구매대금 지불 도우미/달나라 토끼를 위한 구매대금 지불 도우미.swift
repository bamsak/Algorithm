let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 100_001)
dp[1] = 1
dp[2] = 1
dp[3] = 2
dp[4] = 2
dp[5] = 1
dp[6] = 2
dp[7] = 1
if n >= 8 {
    for i in 8...n {
        dp[i] = min(dp[i - 1], dp[i - 2], dp[i - 5], dp[i - 7]) + 1
    }
}
print(dp[n])
