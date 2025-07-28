let nums = readLine()!.split(separator: " ").map { Int($0)! }
let num = min(
  nums[0] * 1000 + nums[1] * 100 + nums[2] * 10 + nums[3],
  nums[1] * 1000 + nums[2] * 100 + nums[3] * 10 + nums[0],
  nums[2] * 1000 + nums[3] * 100 + nums[0] * 10 + nums[1],
  nums[3] * 1000 + nums[0] * 100 + nums[1] * 10 + nums[2]
  )

var result = 0
var check = Set<Int>()

for i in 1111...9999 {
  if "\(i)".contains("0") { continue }
  var temp = 10000
  let t = "\(i)".map { Int(String($0))! }
  let n = min(
      t[0] * 1000 + t[1] * 100 + t[2] * 10 + t[3],
      t[1] * 1000 + t[2] * 100 + t[3] * 10 + t[0],
      t[2] * 1000 + t[3] * 100 + t[0] * 10 + t[1],
      t[3] * 1000 + t[0] * 100 + t[1] * 10 + t[2]
    )
    
  if !check.contains(n) {
    result += 1
    check.insert(n)
  }
  if n == num { break }
}

print(result)