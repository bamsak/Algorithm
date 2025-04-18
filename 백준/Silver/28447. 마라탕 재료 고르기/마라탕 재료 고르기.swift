let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var array = [[Int]]()


for _ in 0..<n {
  array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var result = Int.min
var selected = [Int]()

func dfs(_ i: Int, _ count: Int) {
  if count == k {
    var temp = 0
    for y in 0..<k {
      for x in y + 1..<k {
        temp += array[selected[y]][selected[x]]
      }
    }
    result = max(result, temp)
    return
  }
  
  for j in i..<n {
    selected.append(j)
    dfs(j + 1, count + 1)
    selected.removeLast()
  }
}

dfs(0, 0)

print(result)