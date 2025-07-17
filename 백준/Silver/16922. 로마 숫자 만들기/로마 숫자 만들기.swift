let n = Int(readLine()!)!
let nums = [1, 5, 10, 50]
var visited = [Bool](repeating: false, count: 1001)

var result = 0
func dfs(_ depth: Int, _ num: Int, _ idx: Int) {
  if depth == n {
    if !visited[num] {
      visited[num] = true
      result += 1
    }
    return
  }
  
  for i in idx..<4 {
    dfs(depth + 1, num + nums[i], i)
  }
}

dfs(0, 0, 0)

print(result)