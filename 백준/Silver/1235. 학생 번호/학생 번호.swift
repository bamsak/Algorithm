var nums = [[String]]()
let n = Int(readLine()!)!
for _ in 0..<n {
  nums.append(readLine()!.map { String($0) })  
}

var result = 100
let temp = nums[0]

for i in 0..<temp.count {
  var foo = Set<String>()
  let str = temp[i...].joined()
  foo.insert(str)
  
  for j in 1..<n {
    foo.insert(nums[j][i...].joined())  
  }
  
  if foo.count == nums.count {
    result = min(result, temp.count - i)
  }
}
print(result)