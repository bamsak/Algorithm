let nkab = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k, a, b) = (nkab[0], nkab[1], nkab[2], nkab[3])

var array = [Int](repeating: k, count: n)
var result = 0
var trigger = true

while trigger { 
  for i in 0..<a {
      array[i] += b
  }

  for i in 0..<n {
    array[i] -= 1
    if array[i] == 0 {
      trigger = false
      break
    }
  }
  result += 1
  array.sort()
}

print(result)