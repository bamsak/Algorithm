let n = Int(readLine()!)!
let prices = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [Int](repeating: Int.max, count: n + 1)
dp[0] = 0
for i in 1...n {
    for j in 1...i {
        dp[i] = min(dp[i], dp[i - j] + prices[j - 1])
    }
}

print(dp[n])
