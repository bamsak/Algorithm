let k = Int(readLine()!)!
let signs = readLine()!.split(separator: " ")
var visited = Array(repeating: false, count: 10)
var result = [String]()

for i in 0..<10 {
    visited[i] = true
    dfs("\(i)", 1, i)
    visited[i] = false
}

func dfs(_ nums: String, _ depth: Int, _ num: Int) {
    if depth == k + 1 {
        result.append(nums)
        return
    }
    
    for i in 0..<10 where !visited[i] {
        if signs[depth - 1] == "<" && num < i || signs[depth - 1] == ">" && num > i {
            visited[i] = true
            dfs(nums + "\(i)", depth + 1, i)
            visited[i] = false
        }
    }
}

print(result.last!)
print(result.first!)