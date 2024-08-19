let n = Int(readLine()!)!
let balls = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

func dfs(_ current: Int, _ arr: [Int]) {
    if arr.count == 2 {
        result = max(result, current)
        return
    }
    
    for i in 1..<arr.count - 1 {
        var temp = arr
        temp.remove(at: i)
        dfs(current + arr[i - 1] * arr[i + 1], temp)
    }
}

dfs(0, balls)
print(result)