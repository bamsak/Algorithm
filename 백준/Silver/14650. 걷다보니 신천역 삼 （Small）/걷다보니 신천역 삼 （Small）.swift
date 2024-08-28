let n = Int(readLine()!)!
var visited = Array(repeating: 0, count: 3)
var set = Set<Int>()

func dfs(_ num: Int) {
    if String(num).count == n {
        if num != 0, num % 3 == 0 {
            set.insert(num)
        }
        return
    }
    
    for i in 0..<3 where visited[i] < n {
        visited[i] += 1
        dfs(Int("\(num)" + "\(i)")!)
        visited[i] -= 1
    }
}

dfs(0)
print(set.count)