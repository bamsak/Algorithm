let n = Int(readLine()!)!
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 0, count: n)

for i in 0..<n {
    if i == 0 {
        dp[i] = array[i]
    } else if i == 1 {
        dp[i] = dp[i - 1] + array[i]
    } else if i == 2 {
        dp[i] = max(dp[i - 1], array[i - 1] + array[i], array[i - 2] + array[i])
    } else {
        dp[i] = max(dp[i - 1], dp[i - 2] + array[i], dp[i - 3] + array[i - 1] + array[i])
    }
}

print(dp[n - 1])
