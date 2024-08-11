let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var arr = [String]()

func dfs(_ depth: Int) {
    if depth == m {
        print(arr.joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        arr.append("\(nums[i])")
        dfs(depth + 1)
        arr.popLast()
    }
}
dfs(0)