for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: 1_000_001)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    
    if n >= 4 {
        for i in 4...n {
            dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 3]) % 1_000_000_009
        }
    }
    
    print(dp[n])
}
