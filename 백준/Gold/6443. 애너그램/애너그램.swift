for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.map { $0 }.sorted()
    var visited = Array(repeating: false, count: input.count)
    var arr = [String]()
    
    func dfs(_ depth: Int, _ str: String) {
        var previous: Character = "1"
        
        if depth == input.count {
            arr.append(str)
            return
        }
        
        for i in 0..<input.count where !visited[i] && previous != input[i] {
            visited[i] = true
            dfs(depth + 1, str + "\(input[i])")
            visited[i] = false
            previous = input[i]
        }
    }
    
    dfs(0, "")
    
    arr.forEach { print($0) }
}