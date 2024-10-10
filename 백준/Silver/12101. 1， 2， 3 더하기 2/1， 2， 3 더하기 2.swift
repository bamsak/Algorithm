let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
var temp = [String]()
func dfs(_ num: Int, _ str: String) {
    if num > n {
        return
    }
    if num == n {
        temp.append(str)
        return
    }
    
    for i in 1...3 {
        dfs(num + i, "\(str)\(i)")
    }
}

dfs(0, "")

print(temp.count < k ? -1 : temp[k-1].map { String($0) }.joined(separator: "+"))