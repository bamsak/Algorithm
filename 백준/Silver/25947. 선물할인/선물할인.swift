let nba = readLine()!.split(separator: " ").map { Int($0)! }
let cost = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let (n, b, a) = (nba[0], nba[1], nba[2])

var psum = [Int](repeating: 0, count: n + 1)

for i in 0..<n {
  psum[i + 1] = psum[i] + cost[i]
}

var result = 0

for i in 0...n {
  let t = max(0, i - a)
  let discount = min(i, a)
  
  var total = 0
  
  if t > 0 {
    total += psum[t]
  }
  
  if discount > 0 {
    total += (psum[i] - psum[i - discount]) / 2
  }
  
  if total <= b {
    result = i
  } else {
    break
  }
}
print(result)