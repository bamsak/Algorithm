while let n = Int(readLine()!), n != 0 {
    var array = [Int]()
    
    for _ in 0..<n {
        array.append(Int(readLine()!)!)
    }
    
    var dp = [Int](repeating: 0, count: n)
    dp[0] = array[0]
    
    for i in 1..<n {
        dp[i] = max(dp[i - 1] + array[i], array[i])
    }
    
    print(dp.max()!)
}
