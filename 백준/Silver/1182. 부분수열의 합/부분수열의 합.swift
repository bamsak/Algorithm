let ns = readLine()!.split(separator: " ").map { Int($0)!}
let (n, s) = (ns[0], ns[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Array(repeating: false, count: n)

var result = 0

func dfs(_ depth: Int, _ start: Int, _ sum: Int) {
    if depth >= 1 && sum == s {
        result += 1
    }

    for i in start..<n where !visited[i] {
        visited[i] = true
        dfs(depth + 1, i, sum + nums[i])
        visited[i] = false
    }
}

dfs(0, 0, 0)
print(result)