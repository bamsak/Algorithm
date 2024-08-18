let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var arr = [String]()
var visited = Array(repeating: false, count: n)

func dfs(_ depth: Int, _ start: Int) {
    var previous = 0
    
    if depth == m {
        print(arr.joined(separator: " "))
        return
    }
    
    for i in start..<n where previous != nums[i] {
        previous = nums[i]
        arr.append("\(nums[i])")
        dfs(depth + 1, i)
        arr.removeLast()
    }
}

dfs(0, 0)