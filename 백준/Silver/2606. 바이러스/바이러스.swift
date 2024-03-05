let c = Int(readLine()!)!
let v = Int(readLine()!)!

var connects = Array(repeating: Array(repeating: 0, count: 0), count: c + 1)
var visited = [Bool](repeating: false, count: c + 1)

var count = 0

for _ in 0..<v {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    connects[input[0]].append(input[1])
    connects[input[1]].append(input[0])
}

func dfs(vertex: Int) {
    if visited[vertex] == true { return }
    visited[vertex] = true
    for connect in connects[vertex] {
        if visited[connect] == false {
            dfs(vertex: connect)
            count += 1
        }
    }
}

dfs(vertex: 1)
print(count)
