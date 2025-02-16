let (n, m) = (Int(readLine()!)!, Int(readLine()!)!)
var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

for i in 1...n {
    dp[i][i] = 1
}

for i in 1...n {
    for j in i...m where j != i {
        dp[i][j] = dp[i - 1][j - 1] + dp[i][j - 1]
    }
}

print(dp[n][m])
