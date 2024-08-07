while let input = readLine() {
    if input.count == 1 { break }
    let arr = input.split(separator: " ").map { Int($0)! }
    let k = arr[0]
    let s = Array(arr[1...]).sorted()
    var result = [String]()
    var visited = Array(repeating: false, count: k)
    
    func dfs(_ depth: Int, _ start: Int) {
        if depth == 6 {
            print(result.joined(separator: " "))
            return
        }
        
        for i in start..<k where !visited[i] {
            visited[i] = true
            result.append("\(s[i])")
            dfs(depth + 1, i)
            visited[i] = false
            _ = result.popLast()
        }
    }
    dfs(0, 0)
    print()
}