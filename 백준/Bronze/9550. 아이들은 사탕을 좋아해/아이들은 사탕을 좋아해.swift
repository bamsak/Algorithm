for _ in 0..<Int(readLine()!)! {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    let (_, k) = (nk[0], nk[1])
    
    var result = 0
    
    let candyCount = readLine()!.split(separator: " ").map{ Int($0)! }
    
    for candy in candyCount {
        if k > candy {
            continue
        }
        result += candy / k
    }
    print(result)
}