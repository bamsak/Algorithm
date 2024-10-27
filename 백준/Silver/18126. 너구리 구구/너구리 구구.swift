let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: (room: 0, weight: 0), count: 0), count: n + 1)

for _ in 0..<n - 1 {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    map[a].append((b, c))
    map[b].append((a, c))
}

var visited = Array(repeating: false, count: n + 1)
var result = 0

func dfs(_ room: Int, _ weight: Int){
    visited[room] = true
    result = max(result, weight)
    
    for r in map[room] where !visited[r.room] {
        dfs(r.room, weight + r.weight)
    }
}
dfs(1, 0)

print(result)