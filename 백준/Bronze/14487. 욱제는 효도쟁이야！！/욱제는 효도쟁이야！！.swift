readLine()
let nums = readLine()!.split(separator: " ").map { Int($0)! }
print(nums.reduce(0, +) - nums.max()!)