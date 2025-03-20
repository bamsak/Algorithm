let n = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<n {
  map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var psum = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)

for y in 1...n {
  for x in 1...n {
    psum[y][x] = psum[y - 1][x] + psum[y][x - 1] - psum[y - 1][x - 1] + map[y - 1][x - 1]
  }
}

var result = Int.min

for i in 1...n {
  for y in 0...n - i {
    for x in 0...n - i {
      let sum = psum[y + i][x + i] - psum[y + i][x] - psum[y][x + i] + psum[y][x]
      result = max(result, sum)
    }
  }
}

print(result)