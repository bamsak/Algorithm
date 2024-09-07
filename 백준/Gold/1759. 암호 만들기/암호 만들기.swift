let lc = readLine()!.split(separator: " ").map { Int($0)! }
let (l, c) = (lc[0], lc[1])
let arr = readLine()!.split(separator: " ").map { String($0) }.sorted()
var visited = Array(repeating: false, count: c)
var result = [String]()

func dfs(_ str: String, _ mc: Int, _ jc: Int, _ prev: Int) {
    if str.count == l && mc > 0 && jc > 1{
        result.append(str)
        return
    }
    
    for i in 0..<c where !visited[i] && prev <= i {
        visited[i] = true
        if ["a", "e", "i", "o", "u"].contains(arr[i]) {
            dfs(str + arr[i], mc + 1, jc, i)
        } else {
            dfs(str + arr[i], mc, jc + 1, i)
        }
        visited[i] = false
    }
}

dfs("", 0, 0, 0)

result.forEach {
    print($0)
}