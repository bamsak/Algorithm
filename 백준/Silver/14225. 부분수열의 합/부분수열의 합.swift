let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }

var sums = Set<Int>()

func dfs(_ depth: Int, _ sum: Int) {
    if depth == n {
        if sum > 0 {
            sums.insert(sum)
        }
        return
    }
    
    dfs(depth + 1, sum + nums[depth])
    dfs(depth + 1, sum)
}

dfs(0, 0)

var answer = 1
while sums.contains(answer) {
    answer += 1
}

print(answer)