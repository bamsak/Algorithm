while let input = readLine(), input != "" {
    let temp = input.split(separator: " ")
    let (str, n) = (temp[0].map { $0 }, Int(temp[1])!)
    var arr = [String]()
    var visited = Array(repeating: false, count: str.count)
    
    dfs(0, "")
    
    func dfs(_ depth: Int, _ s: String) {
        if depth == str.count {
            arr.append(s)
            return
        }
        
        for i in 0..<str.count where !visited[i] {
            visited[i] = true
            dfs(depth + 1, "\(s)\(str[i])")
            visited[i] = false
        }
    }
    
    arr.count >= n ? print("\(temp[0]) \(n) = \(arr[n - 1])") : print("\(temp[0]) \(n) = No permutation")
}