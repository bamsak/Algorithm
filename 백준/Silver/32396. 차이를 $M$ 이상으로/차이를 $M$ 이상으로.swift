let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var nums = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0

for i in 1..<n {
  if abs(nums[i] - nums[i - 1]) < m {
    nums[i] = Int.max
    result += 1
  }
}

print(result)