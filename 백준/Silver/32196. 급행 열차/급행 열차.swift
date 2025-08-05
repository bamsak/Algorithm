let nmkxy = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k, x, y) = (nmkxy[0], nmkxy[1], nmkxy[2], nmkxy[3], nmkxy[4])

var array = [(a: Int, b: Int)]()

for _ in 0..<n {
  let ab = readLine()!.split(separator: " ").map { Int($0)! }
  let (a, b) = (ab[0], ab[1])
  
  array.append((a, b))
}

array.sort { 
  return ($0.a * x) - ($0.b * y) < ($1.a * x) - ($1.b * y)
}

var normal = k
var express = k

for i in 0..<m {
  normal += array[i].a
  express -= array[i].b
}

print("\((normal * x) + (express * y))")