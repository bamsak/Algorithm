var dp = [Int](repeating: 0, count: 1_000_001)

let n = Int(readLine()!)!
dp[1] = 1

if n > 1 {
    for i in 2...n {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 1_000_000_007
    }
}

print(dp[n])
