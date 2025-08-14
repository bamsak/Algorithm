let n = Int(readLine()!)!
var result = 0
var temp = -1

for i in 0..<n {
  let nums = readLine()!.split(separator: " ").map { Int($0)! }
  var num = -1
  
  for i in 0..<nums.count - 2 {
    for j in i + 1..<nums.count - 1 {
      for k in j + 1..<nums.count {
        num = max(num, (nums[i] + nums[j] + nums[k]) % 10)
      }
    }
  }
  
  if num >= temp {
    result = i + 1
  }

  temp = max(num, temp)
}

print(result)