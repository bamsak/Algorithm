let nw = readLine()!.split(separator: " ").map { Int($0)! }
let (n, w) = (nw[0], Double(nw[1]))
var tree = [Int](repeating: 0, count: n)

for _ in 0..<n - 1 {
  let uv = readLine()!.split(separator: " ").map { Int($0)! - 1 }
  let (u, v) = (uv[0], uv[1])
  tree[u] += 1
  tree[v] += 1
}

var temp = 0

for i in 1..<n {
  if tree[i] == 1 {
    temp += 1
  }
}

print(w / Double(temp))
