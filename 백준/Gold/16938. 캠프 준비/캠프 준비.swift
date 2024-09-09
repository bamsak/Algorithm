let nlrx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, l, r, x) = (nlrx[0], nlrx[1], nlrx[2], nlrx[3])
let rate = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Array(repeating: false, count: rate.count)
var result = 0

func dfs(_ start: Int, _ count: Int, _ sum: Int, _ mn: Int, _ mx: Int) {
    if count >= 2 && sum >= l && sum <= r && mx - mn >= x{
        result += 1
    }
    
    for i in start..<rate.count where !visited[i] {
        visited[i] = true
        dfs(i + 1, count + 1, rate[i] + sum, min(rate[i], mn), max(rate[i], mx))
        visited[i] = false
    }
}

dfs(0, 0, 0, Int.max, -1)
print(result)
