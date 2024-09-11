let ab = readLine()!.split(separator: " ")
let (a, b) = (ab[0].map { String($0) }, Int(ab[1])!)
var visited = Array(repeating: false, count: a.count)
var result = -1
func dfs(_ depth: Int, _ str: String) {
    if depth == a.count {
        if str.first! != "0", let num = Int(str), num < b {
            result = max(result, num)
        }
        return
    }
    
    for i in 0..<a.count where !visited[i] {
        visited[i] = true
        dfs(depth + 1, str + a[i])
        visited[i] = false
    }
}

dfs(0, "")
print(result)