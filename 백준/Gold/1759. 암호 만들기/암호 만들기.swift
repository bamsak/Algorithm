let lc = readLine()!.split(separator: " ").map { Int($0)! }
let (l, c) = (lc[0], lc[1])
let arr = readLine()!.split(separator: " ").map { String($0) }.sorted()
var visited = Array(repeating: false, count: c)
var result = ""

func dfs(_ str: String, _ mc: Int, _ jc: Int, _ prev: Int) {
    if str.count == l {
        if mc > 0 && jc > 1 {
            result += "\(str)\n"
        }
        return
    }
    
    for i in prev..<c where !visited[i] {
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

print(result)