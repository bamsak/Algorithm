var dp = Array(repeating: Array(repeating: 1, count: 10), count: 65)

for i in 2..<65 {
    for j in 0..<10 {
        var temp = 0
        for k in j..<10 {
            temp += dp[i-1][k]
        }
        dp[i][j] = temp
    }
}

for _ in 0..<Int(readLine()!)! {
    let input = Int(readLine()!)!
    print(dp[input].reduce(0, +))
}
