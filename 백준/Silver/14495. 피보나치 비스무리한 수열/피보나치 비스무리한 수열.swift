let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 117)

for i in 1...n {
    if i < 4 {
        dp[i] = 1
        continue
    }
    dp[i] = dp[i - 1] + dp[i - 3]
}

print(dp[n])