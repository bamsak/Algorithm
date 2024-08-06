let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var arr = [String]()
var visited = Array(repeating: false, count: n)

func foo(_ depth: Int) {
    if depth == m {
        print(arr.joined(separator: " "))
        return
    }
    
    for i in 0..<n where !visited[i] {
        visited[i] = true
        arr.append("\(nums[i])")
        foo(depth + 1)
        visited[i] = false
        _ = arr.popLast()
    }
}

foo(0)