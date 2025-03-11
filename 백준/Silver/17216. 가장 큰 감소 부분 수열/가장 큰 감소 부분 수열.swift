let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = nums

for i in 0..<n {
    for j in 0..<i where nums[i] < nums[j] {
        dp[i] = max(dp[i], dp[j] + nums[i])
    }
}

print(dp.max()!)