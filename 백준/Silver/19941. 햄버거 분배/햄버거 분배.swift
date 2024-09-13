let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var arr = readLine()!.map { String($0) }
var visited = Array(repeating: false, count: arr.count)
var result = 0

for i in 0..<n where arr[i] == "P" {
    for j in i - k...i + k {
        if j < 0 || j >= n { continue }
        if arr[j] != "H" || visited[j] { continue }
        
        visited[j] = true
        result += 1
        break
    }
}
print(result)