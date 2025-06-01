let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)

for i in 1...9 {
    dp[1][i] = 1
}

for i in 1..<n {
    for j in 1..<10 {
        for next in max(1, j-2)...min(9, j+2) {
            dp[i+1][next] = (dp[i+1][next] + dp[i][j]) % 987_654_321
        }
    }
}

print(dp[n][1...].reduce(0, +) % 987_654_321)
