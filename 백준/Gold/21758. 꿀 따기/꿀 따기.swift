let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var right = array
var left = array

for i in 1..<n {
  right[i] += right[i - 1]
  left[n - 1 - i] += left[n - i]
}

var result = Int.min

for i in 1..<n - 1 {
  let l = (left[0] - array[0] - array[i]) + (left[i] - array[i])
  let mid = (left[i] - array[n - 1]) + (right[i] - array[0])
  let r = (right[n - 1] - array[n - 1] - array[i]) + (right[i] - array[i])
  
  result = max(result, l, mid, r)
}

print(result)