let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var arr = [String]()
var visited = Array(repeating: false, count: n)
var s = Set<String>()

func dfs(_ depth: Int) {
    if depth == m {
        let result = arr.joined(separator: " ")
        if !s.contains(result) {
            s.insert(result)
            print(result)
        }
        return
    }
    
    for i in 0..<n where !visited[i] {
        visited[i] = true
        arr.append("\(nums[i])")
        dfs(depth + 1)
        arr.removeLast()
        visited[i] = false
    }
    
}

dfs(0)
