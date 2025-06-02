let nab = readLine()!.split(separator: " ").map { Int($0)! }
var (n, a, b) = (nab[0], nab[1], nab[2])

var one = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var two = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = 0

if n % 2 != 0 && !one.isEmpty {
  result += one.removeLast()
  n -= 1
}

for _ in 0..<n / 2 {
  let t1 = one.count >= 2 ? one[one.count - 1] + one[one.count - 2] : 0
  let t2 = two.isEmpty ? 0 : two.last!
  
  
  if t1 > t2 {
    result += t1
    one.removeLast()
    one.removeLast()
  } else { 
    result += t2
    two.removeLast()
  }
}

print(result)