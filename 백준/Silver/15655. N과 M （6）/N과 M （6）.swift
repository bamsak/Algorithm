let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var temp = [String]()
var visited = Array(repeating: false, count: n)

func dfs(_ depth: Int, _ start: Int) {
    if depth == m {
        print(temp.joined(separator: " "))
        return
    }
    
    for i in start..<n where !visited[i] {
        visited[i] = true
        temp.append("\(arr[i])")
        dfs(depth + 1, i)
        temp.popLast()
        visited[i] = false
    }
}
dfs(0, 0)