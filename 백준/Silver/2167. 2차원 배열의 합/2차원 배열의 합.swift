let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var array = [[Int]]()

for _ in 0..<n {
  array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var psum = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

for y in 1...n {
  for x in 1...m {
    psum[y][x] = array[y - 1][x - 1] + psum[y - 1][x] + psum[y][x - 1] - psum[y - 1][x - 1]
  }
}

for _ in 0..<Int(readLine()!)! {
  let xy = readLine()!.split(separator: " ").map { Int($0)! }
  let (x1, y1, x2, y2) = (xy[0], xy[1], xy[2], xy[3])
  
  print(psum[x2][y2] - psum[x1 - 1][y2] - psum[x2][y1 - 1] + psum[x1 - 1][y1 - 1])
}