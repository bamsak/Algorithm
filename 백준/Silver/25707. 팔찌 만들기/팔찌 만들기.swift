let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)!}.sorted()

var result = 0

for i in 0..<n - 1 {
    result += abs(nums[i] - nums[i + 1])
}
result += nums.last! - nums.first!
print(result)
