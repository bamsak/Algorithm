for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = [Int](repeating: -1_000_001, count: n + 1)
    
    for i in 1...n {
        dp[i] = max(dp[i - 1] + nums[i - 1], nums[i - 1])
    }
    
    print(dp.max()!)
}