let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)

dp[1] = 1

if n > 1 {
    dp[2] = 3
    
    for i in 3..<n + 1 where dp[i] == 0 {
        dp[i] = (dp[i - 1] + (dp[i - 2] * 2)) % 10007
    }
}

print(dp[n])
