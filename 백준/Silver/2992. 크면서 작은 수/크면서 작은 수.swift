let x = readLine()!.map { String($0) }
let n = Int(x.joined())!

var result = Int.max
var visited = Array(repeating: false, count: x.count)

func dfs(_ str: String) {
    if str.count ==  x.count, let num = Int(str), num > n {
        result = min(result, num)
        return
    }
    
    for i in 0..<x.count where !visited[i] {
        visited[i] = true
        dfs(str + x[i])
        visited[i] = false
    }
}

dfs("")

print(result == Int.max ? "0" : result)
