for i in 0..<Int(readLine()!)! {
    let pq = readLine()!.split(separator: " ").map { Int($0)! }
    let (p, q) = (pq[0], pq[1])
    var dp = [Int](repeating: 0, count: 10_001)
    dp[1] = 1
    
    if p >= 2 {
        for i in 2...p {
            dp[i] = (dp[i - 1] + dp[i - 2]) % q
        }
    }
    
    dp[1] %= q
    
    print("Case #\(i + 1): \(dp[p])")
}
