let n = Int(readLine()!)!
var tree = Array(repeating: Array(repeating: 0, count: 0), count: n)
let nums = readLine()!.split(separator: " ").map { Int($0)! }

var root = 0
for i in 0..<n {
    if nums[i] == -1 {
        root = i
    } else {
        tree[nums[i]].append(i)
    }
}

var visited = [Bool](repeating: false, count: n)

let input = Int(readLine()!)!
var result = 0

func dfs(_ node: Int) {
    visited[node] = true
    
    var leaf = true
    
    for edge in tree[node] where !visited[edge] && edge != input {
        dfs(edge)
        leaf = false
    }
    
    if leaf { result += 1 }
}



if root != input {
    dfs(root)
}

print(result)
