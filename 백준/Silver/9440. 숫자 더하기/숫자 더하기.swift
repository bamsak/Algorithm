while let input = readLine(), input != "0" {
  let temp = input.split(separator: " ").map { Int($0)! }
  let n = temp[0]
  var nums = temp[1...].sorted()
  
  var zeroCount = 0
  
  for num in nums {
    if num == 0 {
      zeroCount += 1
    }
  }
  
  if zeroCount == 1 && nums.count > 2 {
    nums.swapAt(0, 2)
  }
  
  if zeroCount >= 2 && nums.count > zeroCount + 1 {
    nums.swapAt(0, zeroCount)
    nums.swapAt(1, zeroCount + 1)
  }
  var num1 = ""
  var num2 = ""
  
  for i in 0..<nums.count {
    if i % 2 == 0 {
      num1 += "\(nums[i])"
    } else {
      num2 += "\(nums[i])"
    }
  }
  
  print(Int(num1)! + Int(num2)!)
}