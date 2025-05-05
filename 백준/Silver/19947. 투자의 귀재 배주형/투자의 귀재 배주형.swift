let hy = readLine()!.split(separator: " ").map { Int($0)! }
let (h, y) = (hy[0], hy[1])
var dp = [Int](repeating: 0, count: y + 1)
dp[0] = h

for i in 1...y {
    dp[i] = Int(Double(dp[i-1]) * 1.05)
    if i >= 3 {
        dp[i] = max(dp[i], Int(Double(dp[i-3]) * 1.2))
    }
    if i >= 5 {
        dp[i] = max(dp[i], Int(Double(dp[i-5]) * 1.35))
    }
}

print(dp[y])
