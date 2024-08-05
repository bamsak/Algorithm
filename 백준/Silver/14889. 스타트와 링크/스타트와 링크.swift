let n = Int(readLine()!)!
var board = Array(repeating: Array(repeating: 0, count: 0), count: n)
var visited = Array(repeating: false, count: n)
var result = Int.max

for i in 0..<n {
    board[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func dfs(_ depth: Int, _ start: Int){
    if depth == n / 2 {
        var s = 0
        var l = 0
        for y in 0..<n {
            for x in 0..<n {
                if visited[y] && visited[x] {
                    s += board[y][x]
                    continue
                }
                
                if !visited[y] && !visited[x] {
                    l += board[y][x]
                }
            }
        }
        
        result = min(result, abs(s - l))
        return
    }
    
    for i in start..<n where !visited[i] {
        visited[i] = true
        dfs(depth + 1, i)
        visited[i] = false
    }
}

dfs(0, 0)
print(result)