import Foundation

let n = Int(readLine()!)!
var nums = [Double]()
for _ in 0..<n {
    let input = Double(readLine()!)!
    nums.append(input)
}

var dp = [Double](repeating: 1, count: n)
dp[0] = nums[0]

for i in 1..<n {
    dp[i] = max(nums[i], dp[i - 1] * nums[i])
}

print(String(format: "%.3f", dp.max()!))
