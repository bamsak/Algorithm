let n = Int(readLine()!)!
var stairs = [Int]()

for _ in 0..<n {
    stairs.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 0, count: n)

for i in 0..<n {
    if i == 0 {
        dp[i] = stairs[i]
    } else if i == 1 {
        dp[i] = stairs[i - 1] + stairs[i]
    } else if i == 2 {
        dp[i] = max(stairs[i - 2] + stairs[i], stairs[i - 1] + stairs[i])
    } else {
        dp[i] = max(stairs[i] + stairs[i - 1] + dp[i - 3], stairs[i] + dp[i - 2])
    }
}

print(dp[n - 1])
