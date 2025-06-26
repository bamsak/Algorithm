let n = Int(readLine()!)!
var nums = [Int]()
for _ in 0..<n {
  nums.append(Int(readLine()!)! - 1)
}

var result = [Int]()
for i in 1..<n {
  var check = false
  
  for j in 0..<result.count where nums[i] % result[j] == 0 {
    check = true
    break
  }
  
  if !check {
    result.append(nums[i])
  }
  
}
print(result.count)