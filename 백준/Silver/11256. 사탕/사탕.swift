for _ in 0..<Int(readLine()!)! {
    let jn = readLine()!.split(separator: " ").map { Int($0)! }
    var (j, n) = (jn[0], jn[1])
    var maxCandys = [Int]()
    var count = 0
    
    
    for _ in 0..<n {
        let rc = readLine()!.split(separator: " ").map { Int($0)! }
        maxCandys.append(rc.reduce(1, *))
    }
    
    let sortedMax = maxCandys.sorted(by: >)
    
    for candy in sortedMax {
        j -= candy
        count += 1
        if j <= 0 {
            break
        }
    }
    print(count)
}