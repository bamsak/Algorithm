let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
let k = Int(readLine()!)!

var left = 0
var sum = 0

var result = 0

for r in 0..<n {
    sum += nums[r]
    
    while left <= r && sum > k {
        result += (n - r)
        sum -= nums[left]
        left += 1
    }
}

print(result)
