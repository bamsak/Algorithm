let n = Int(readLine()!)!
var foods = [Int]()

for _ in 0..<n {
    foods.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 0, count: n)

for i in 0..<n {
    if i == 0 {
        dp[i] = foods[i]
    } else if i == 1 {
        dp[i] = max(foods[i], dp[i - 1] + (foods[i] / 2) )
    } else if i == 2 {
        dp[i] = max(dp[i - 1], foods[i - 1] + (foods[i] / 2), foods[i - 2] + foods[i])
    } else {
        dp[i] = max(dp[i - 1], dp[i - 2] + foods[i], dp[i - 3] + foods[i - 1] + (foods[i] / 2))
    }
}

print((dp[n - 1]))