let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var dp = [Int](repeating: 0, count: n + 1)
dp[0] = 1

for i in 1...n {
    dp[i] = dp[i - 1]
    if i >= m {
        dp[i] = (dp[i] + dp[i - m]) % 1_000_000_007
    }
}

print(dp[n])
