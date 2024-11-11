let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var nums = [Int]()

for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}

nums.sort()

var left = 0
var right = 0
var result = Int.max

while right < n && left < n {
    let temp = abs(nums[left] - nums[right])
    
    if temp == m {
        result = temp
        break
    }
    
    if temp < m {
        right += 1
    } else {
        result = min(temp, result)
        left += 1
    }
}

print(result)