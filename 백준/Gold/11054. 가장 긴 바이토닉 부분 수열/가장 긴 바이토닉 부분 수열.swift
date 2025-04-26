let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }

var dp = [Int](repeating: 1, count: n)
var rdp = [Int](repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i where nums[i] > nums[j] {
        dp[i] = max(dp[i], dp[j] + 1)
    }
}

for i in (0..<n - 1).reversed() {
    for j in (i + 1..<n).reversed() where nums[i] > nums[j] {
        rdp[i] = max(rdp[i], rdp[j] + 1)
    }
}

var result = 1

for i in 0..<n {
    result = max(result, dp[i] + rdp[i] - 1)
}

print(result)
