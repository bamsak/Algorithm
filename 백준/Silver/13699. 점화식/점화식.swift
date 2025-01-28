let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)

dp[0] = 1

if n > 0 {
    for i in 1...n {
        for j in 0..<i {
            dp[i] += dp[j] * dp[i - j - 1]
        }
    }
}

print(dp[n])
