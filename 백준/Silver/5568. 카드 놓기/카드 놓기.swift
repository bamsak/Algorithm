let (n, k) = (Int(readLine()!)!, Int(readLine()!)!)
var cards = [Int]()
var s = Set<Int>()
var visited = Array(repeating: false, count: n)
for _ in 0..<n {
    cards.append(Int(readLine()!)!)
}

func dfs(_ depth: Int, _ num: String){
    if depth == k {
        s.insert(Int(num)!)
        return
    }
    
    for i in 0..<n where !visited[i] {
        visited[i] = true
        dfs(depth + 1, num + "\(cards[i])")
        visited[i] = false
    }
}


dfs(0, "")
print(s.count)
