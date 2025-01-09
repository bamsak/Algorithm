let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [Int](repeating: Int.min, count: n)
dp[0] = nums[0]

for i in 1..<n {
    dp[i] = max(nums[i], nums[i] + dp[i - 1])
}

print(dp.max()!)