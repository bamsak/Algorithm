let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)

for i in 0..<10 {
    dp[1][i] = 1
}

if n > 1 {
    for i in 2...n {
        for j in 0..<10 {
            for k in j..<10 {
                dp[i][j] += (dp[i - 1][k] % 10_007)
            }
        }
    }
}

print(dp[n].reduce(0, +) % 10_007)
