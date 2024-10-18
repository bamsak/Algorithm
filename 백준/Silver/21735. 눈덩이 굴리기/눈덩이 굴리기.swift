let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let snows = readLine()!.split(separator: " ").map { Int($0)! }

var result = 0
func dfs(_ depth: Int, _ size: Int = 1, _ count: Int = 0){
    if count == m || depth == n - 1 {
        result = max(result, size)
        return
    }
    
    if depth + 1 < n {
        dfs(depth + 1, size + snows[depth + 1], count + 1)
    }
    if depth + 2 < n {
        dfs(depth + 2, (size / 2) + snows[depth + 2], count + 1)
    }
}

dfs(-1)
print(result)