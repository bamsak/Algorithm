let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [Int](repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i where nums[i] > nums[j] {
        dp[i] = max(dp[i], dp[j] + 1)
    }
}

print(dp.max()!)