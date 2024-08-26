let arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

func dfs(_ depth: Int, _ score: Int, _ prev1: Int, _ prev2: Int) {
    if depth == arr.count {
        if score > 4 {
            result += 1
        }
        return
    }
    
    for i in 1...5 where prev1 != i || prev2 != i {
        let newS = i == arr[depth] ? score + 1 : score
        dfs(depth + 1, newS, prev2, i)
    }
}

dfs(0, 0, 0, 0)
print(result)