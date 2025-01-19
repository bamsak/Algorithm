let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = nums

for i in 0..<n {
    for j in 0..<i where nums[j] < nums[i] {
        dp[i] = max(dp[j] + nums[i], dp[i])
    }
}

print(dp.max()!)