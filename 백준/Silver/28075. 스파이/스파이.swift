let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var array = [[Int]]()

for _ in 0..<2 {
  array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var result = 0

func dfs(_ day: Int, _ sum: Int, _ prev: Int) {
  if day >= n {
    if sum >= m {
      result += 1
    }
    return
  }
  
  for i in 0..<2 {
    for j in 0..<3 {
      let new = prev == j ? array[i][j] / 2 : array[i][j]
      dfs(day + 1, sum + new, j)
    }
  }
}

dfs(0, 0, -1)
print(result)