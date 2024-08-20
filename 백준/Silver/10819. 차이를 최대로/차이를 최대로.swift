let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Array(repeating: false, count: n)
var result = -1

func dfs(_ depth: Int, _ now: Int, _ sum: Int) {
    if depth == n {
        result = max(result, sum)
        return
    }
    
    for i in 0..<n where !visited[i] {
        visited[i] = true
        dfs(depth + 1, i, sum + abs(nums[now] - nums[i]))
        visited[i] = false
    }
}

for i in 0..<n {
    visited[i] = true
    dfs(1, i, 0)
    visited[i] = false
}

print(result)