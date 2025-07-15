let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {  1.0 / Double($0)! }

var result = 0

func dfs(_ idx: Int, _ sum: Double) {
  if idx == n {
    if sum <= 1.01 && sum >= 0.99 {
      result += 1
    }
    return
  }
  
  dfs(idx + 1, sum)
  
  dfs(idx + 1, sum + arr[idx])
}

dfs(0,0)
print(result)