let n = Int(readLine()!)!
var sArr = [Int]()
var bArr = [Int]()
for _ in 0..<n {
    let sb = readLine()!.split(separator: " ").map { Int($0)! }
    sArr.append(sb[0])
    bArr.append(sb[1])
}
var result = Int.max

func dfs(_ depth: Int, _ s: Int, _ b: Int, _ count: Int) {
    if count > 0 {
        result = min(result, abs(s - b))
    }
    
    if depth == n {
        return
    }
    
    dfs(depth + 1, s * sArr[depth], b + bArr[depth], count + 1)
    dfs(depth + 1, s, b, count)
}

dfs(0, 1, 0, 0)
print(result)