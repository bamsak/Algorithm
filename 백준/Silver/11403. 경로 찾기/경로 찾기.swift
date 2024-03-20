let n = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 0, count: 0), count: n)

for i in 0..<n {
    graph[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var visited = Array(repeating: false, count: n)
var resultArr = Array(repeating: Array(repeating: "0", count: n), count: n)
var stack = [(start: Int, end: Int)]()

for i in 0..<n {
    stack.append((i, i))
    
    while stack.isEmpty == false {
        let now = stack.removeLast()
        
        for j in 0..<n {
            if graph[now.end][j] == 1 && visited[j] == false {
                resultArr[now.start][j] = "1"
                visited[j] = true
                stack.append((now.start, j))
            }
        }
    }
    
    visited = Array(repeating: false, count: n)
}

var result = ""

for r in 0..<n {
    result += "\(resultArr[r].joined(separator: " "))\n"
}

print(result)
