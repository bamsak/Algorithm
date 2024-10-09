for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var result = 0
    dfs(0, &result, n)
    print(result)
}

func dfs(_ num: Int, _ result: inout Int, _ n: Int) {
    if num > n { return }
    if num == n {
        result += 1
        return
    }
    
    for i in 0..<3  {
        dfs(num + i + 1, &result, n)
    }
}