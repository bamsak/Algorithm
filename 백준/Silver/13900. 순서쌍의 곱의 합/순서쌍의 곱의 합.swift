let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var total = nums.reduce(0, +)
var result = 0

for i in 0..<n {
    total -= nums[i]
    result += nums[i] * total
}

print(result)
