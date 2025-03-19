let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var heights = readLine()!.split(separator: " ").map { Int($0)! }
var psum = [Int](repeating: 0, count: n + 1)

for _ in 0..<m {
  let abk = readLine()!.split(separator: " ").map { Int($0)! }
  let (a, b, k) = (abk[0] - 1, abk[1], abk[2])
  
  psum[a] += k
  psum[b] -= k
}

for i in 1...n {
  psum[i] += psum[i - 1]
}

for i in 0..<n {
  heights[i] += psum[i]
}

print(heights.map { String($0) }.joined(separator: " "))