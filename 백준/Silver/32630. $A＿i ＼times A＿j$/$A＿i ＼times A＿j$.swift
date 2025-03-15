let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let l = nums[n - 1] * nums[n - 2] * 2
let f = nums[0] * nums[1] * 2
let sum = nums.reduce(0, +)

let temp = sum - (nums[n - 1] + nums[n - 2])
let temp2 = sum - (nums[0] + nums[1])


print(max(sum, temp + l, temp2 + f))
