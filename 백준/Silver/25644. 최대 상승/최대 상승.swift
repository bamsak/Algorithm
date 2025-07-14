let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0
var prev = nums[0]

for i in 1..<n {
    if nums[i] < prev {
        prev = nums[i]
        continue
    }
    
    result = max(result, nums[i] - prev)
}

print(result)
