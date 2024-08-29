let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let kits = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Array(repeating: false, count: n)
var result = 0

func dfs(_ depth: Int, _ weight: Int) {
    if depth == n {
        result += 1
        return
    }
    
    for i in 0..<n where !visited[i] && weight - k + kits[i] >= 500 {
        visited[i] = true
        dfs(depth + 1, weight - k + kits[i])
        visited[i] = false
    }
}

dfs(0, 500)
print(result)
