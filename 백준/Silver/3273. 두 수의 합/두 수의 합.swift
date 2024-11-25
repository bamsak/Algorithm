let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let x = Int(readLine()!)!
var left = 0
var right = n - 1

var result = 0

while left < right {
    let sum = nums[left] + nums[right]
    if sum == x {
        result += 1
    }
    
    if sum < x {
        left += 1
    } else {
        right -= 1
    }
}

print(result)
